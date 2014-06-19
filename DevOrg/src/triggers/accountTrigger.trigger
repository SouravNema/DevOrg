trigger accountTrigger on Account (before insert) {
    
    for(account a:trigger.new){
        
        a.name = 'myaccount';
        
    }
    contact ct = new contact(lastname ='nema');
    insert ct;
    
}