/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-03-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class SOQLDEMO {
    public static void accountSOQL_1() {
        list<account> listAccount = [select id, name from account where name like '%a%'];
        system.debug('list of account --> ' + listAccount);
    }

    public static void accountSOQL_11() {
       account acc = [select id, name from account order by createddate desc limit 1];
       system.debug('latest created account is -> ' + acc);
    }

    public static void accountSOQL_2() {
        account acc = [select id, name, phone, AccountNumber from account order by createddate desc limit 1];
        system.debug('latest created account is -> ' + acc);

        string accName = acc.name;
        string accphone = acc.phone;
        system.debug('acc name is ' + accName + ', acc phone is ' + accphone + ', account number is ' + acc.AccountNumber);
     }

     public static void accountSOQL_3() {
        List<Account> listAcc = [select id, name, phone, accountnumber, ShippingCity from account 
        order by createddate desc];

        for (Account eachAcc : listAcc) {
            string accName = eachAcc.Name;
            string accphone = eachAcc.Phone;
            system.debug('acc name is ' + accName + ', acc phone is ' + accphone + ', account number is ' + eachAcc.AccountNumber);
            string sc = eachAcc.ShippingCity;
        }
     }

     public static void accountSOQL_filter(string accNameFilter) {
        //we want to filter with accNameFilter (string varialbe) in SOQL
        //to use variable in SOQL we must add ':' (colon) before variable name
        list<account> listAcc = [select id, name ,phone from account where name = :accNameFilter];
        system.debug('list of accounts -> ' + listAcc);
     }
     select id,name,accountName, from contact where account.industry = 'Energy'
     
   }

   //TURKISHREVISION PARAMETRELİ METOTTA YAZMA
   public class SOQLDEMO {
      //Account recorlarindan Industry 'Education' olanlarin listesinin record sayisini bulup return eden bir metot yazin..
      public static integer accountIndustry(string indstry) {
          //List<Account> accList = [select id, name from account where industry = 'Education'];
          List<Account> accList = [select id, name from account where industry =: indstry]; 
          System.debug(accList);
          integer recordSayisi = accList.size();
          return recordSayisi;
      }
  }
}








