//
//  APIList.swift
//  MVCDemo
//

//

import Foundation
import UIKit

struct APIList
{

    let BASE_URL = "http://sep1.seppro.net/Agnisteelandroid/"
 
    
        func getUrlString(url: urlString) -> String
        {
            return BASE_URL + url.rawValue
        }

}

    
enum urlString: String
{
    case ADDBIRTHDAYDATE = "family_members_clients_insert.php?birthday="
    case REDEEMREQUESTOTPVALIDATE = "redeem_request_validate.php?red_points="
    case REDEEMOTPSENDAPI = "redeem_request_1.php?enrollmentno="
    case ADDNEWCUSTOMER = "insertbydistributor_1.php?"
    case PRODUCTSALE = "insertbydistributororder_1.php?"
    case REWARDPOINTLIST = "redeem_products.php?key=V0A6I1S7H5U2raJIpkzZ0u6h1s7i5a2v&points="
    case ADDCUSTOMERENROLLMENT = "mapbuyertodistributor_1.php?distributor_id="
    case STOCKQUANTITYGET = "get_distributor_cur_available_quantity.php?distributor_id="
    case VIEWBIRTHDAY = "family_members_clients_view.php?doc_id="
    case ENROLLMENTNUMBER = "findbuyer.php?enrollment_no="
    case CUSTOMERPAGE = "unapproveddistributorentry.php?distributorid="
    case REWARDSPAGE = "get_all_agni_gift_products.php"
    case SALESVALUEGETAPI = "viewbydistributor.php?distributorid="
    case PARTICULARBILLVALUE = "get_receipt_data_matching_billno.php?billNo="
    case BILLDETAILS = "get_particular_distributor_billing_details.php?distributor_alies="
    case CREDITLIMIT = "distributor_order_history.php?dist_id="
    case OTPNUMBER = "distributor_login.php?loginid=8675564151&otp="
    case LOGINMOBILENUMBER = "send_otp.php?mobile_no="
  
 
}

