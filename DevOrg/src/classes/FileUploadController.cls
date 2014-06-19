/*Created by-:Sourav Nema  */

public with sharing class FileUploadController {
 
  public Attachment attachment {
    get {
      if (attachment == null)
        attachment = new Attachment(ContentType ='.jpg');
      return attachment;
    }
    set;
  }
 
  public PageReference upload() {
    
    try {
              
      String contactId = ApexPages.currentPage().getParameters().get('id');
      Contact user = [select name from contact where id =:contactId];
      system.debug('content type is +++++'+attachment.ContentType);  
     
      attachment.ParentId = contactId;  
      attachment.Name = user.name+' Image';
      insert attachment;
      user.imageURL__c = URL.getSalesforceBaseUrl().toExternalForm()+'/servlet/servlet.FileDownload?file='+attachment.Id;
      update user;  
           
    } catch (DMLException e) {
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading file'));
      return null;
    } finally {
      attachment.body = null; // clears the viewstate
      attachment = new attachment();
    }
 
    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'File uploaded successfully'));
    return null;
  }
 
}