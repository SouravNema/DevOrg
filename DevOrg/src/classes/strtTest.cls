@isTest
public class strtTest{
    
    static list<account> accList = new list<account>();
    public static testMethod void  myTest(){
    for(integer i=1;i<=40;i++){
        account ac = new account(name ='sourav');
        insert ac;
        
      
       }
        //System.assert(accList.size()== 190);
        //accList = [select id from account where name = 'sourav'];
        System.debug('number of dml '+accList.size());
        Test.startTest();
            System.debug('number of dml executed '+Limits.getDMLStatements());
            System.debug('number of dml remain '+Limits.getLimitDMLStatements());
        Test.stopTest();    
         
    }   

    
    
}