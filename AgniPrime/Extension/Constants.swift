//
//  Constants.swift
//  AgniPrime
//
//  Created by MAC on 28/03/22.
//

import Foundation
import UIKit


let screenWidth = UIScreen.main.bounds.width

struct Constants {
    
    static let DeviceId = UIDevice().identifierForVendor?.uuidString ?? UUID().uuidString
    static let OsVersion = UIDevice.current.systemVersion
 //   static let ModelName = UIDevice.current.modelName
    static let OsName = UIDevice.current.systemName
    static let AppVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    static let BatteryLevel = UIDevice.current.batteryLevel
    static let updateApp = "appUpdate"
    static let demoScreenShown = "DemoScreenShown"
   static let doneLogin = "loginComplete"
    static let googleLogin = "googleLogin"
    static let environmentKey = "AppEnvironment"
    static let isTestingEnabled = false
    static let testUserNo = "8248350384"
    static let testPassword = "123456"
    static let isProduction = false
    static let imageUrl = "http://sep1.seppro.net/gift_product_image/"
    
    
    //MARK: - ContentKeys
  
    struct AgniPrimeKeys {
       static let alies = "alies"
        
        
    }
    //MARK: - ContentKeys
  
    struct ErrorKeys {
        static let inalidLoginNumber = "Invalid Mobile Number"
        static let invalidotp = "Invalid Otp"
        static let commonError = "alies"

    }
    
    
    //MARK: - ContentKeys
  
    struct OnboardingKeys {
        static let splash1 = "EXPLORE RESTAURANTS".localized
        static let splash1Description = "Explore restaurants that are available for takeaway or delivery near you.".localized
           static let splash2 = "PLACE YOUR ORDER".localized
           static let splash2Description = "Browse menu and build your order in seconds.".localized
           static let splash3 = "RECEIVE YOUR FOOD".localized
           static let splash3Description = "Pay online securely and enjoy your food order.".localized
           static let splash4 = "Product Activation".localized
           static let splash4Description = "Generate UPI QR or live API & Salt Keys for payment gateway after completing all the steps in activity board".localized
           static let splash5 = "Upload KYC & Bank Info".localized
           static let splash5Description = "Submit KYC Documents and provide the bank details for the settlement process. This can be approved/ rejected by the admin. status will be notified".localized
           
       }
       
       struct LoginKeys {
           static let header1 = "Let's get started".localized
           static let header2 = "Welcome".localized
           static let header3 = "to BasisPay Merchants".localized
           static let header4 = "Enter your mobile number".localized
           static let mobNumberPlaceholder = "Mobile Number".localized
           static let passPlaceholder = "Password".localized
           static let forgotPassword = "Forgot Password".localized
           static let continueValue  = "Continue".localized
           static let signUp = "Signup"
       }
       
       struct OtpVerificationKeys {
           static let header1 = "OTP Verification".localized
           static let header2 = "Enter 6 digits code".localized
           static let description = "Note: We have sent 6 digits one-time verification code to your registered mobile number.".localized
           static let resendOTP = "Resend OTP".localized
           static let proceed = "Verify to proceed".localized
       }
       
       struct ForgotPasswordKeys {
           static let header1 = "Forgot Password?".localized
           static let header2 = "Enter Mobile Number".localized
           static let description = "Please enter your register mobile number to update password".localized
           static let placeholderText = "Mobile Number".localized
           static let generteOtp = "Generate OTP".localized
       }
       
       struct ForgotPasswordOtpVerificationKeys {
         static let header1 = "Forgot Password OTP Verification".localized
           static let header2 = "Enter 6 digits code".localized
           static let description = "Note: We have sent 6 digits one-time verification code to your registered mobile number.".localized
           static let resendOTP = "Resend OTP".localized
           static let resetPassword = "Reset Password".localized
       }
       
    struct NewPasswordScreenKeys {
        static let header1 = "New Password".localized
        static let header2 = "Enter New password".localized
        static let header3  = "Please update your new password"
        static let description = "Please enter your register mobile number to update password".localized
        static let placeholder1 = "Password".localized
        static let placeholder2 = "Confirm Password".localized
        static let savePassword = "Save Password".localized
        
    }
       
       struct RegistrationKeys {
           static let header1 = "Registration".localized
           static let placeholder1 = "Full Name".localized
           static let placeholder2 = "Shop Name".localized
           static let header3 = "Business Category".localized
           static let placeholder3 = "Mobile Number".localized
           static let placeholder4 = "Email Address".localized
           static let placeholder5 = "New Password".localized
           static let placeholder6 = "Re-enter Password".localized
           static let agreeTerms = "I agree to the terms and condition".localized
           static let applyButton = "Apply"
       }
    
    struct HomeScreenKeys {
        static let title = "Home"
        static let header1 = "New Arrivals"
        static let header2 = "Offer Corner"
        static let header3 = "Our Features"
        static let header4 = "News Letter"
        static let featuresTab1 = "1000+ Products"
        static let featuresTab2 = "Quick Shipping"
        static let featuresTab3 = "Quick Order Delivery"
        static let featuresTab4 = "Cost effective pricing"
        static let featuresTab5 = "Smart delivery"
        static let featuresTab6 = "Easy returns"
        static let placeholder = "Enter your email address"
        static let footerLabel1 = "Subscribe to our newsletter to get all the latest fashion news and exclusive offers"
        static let footerLabel2 = "Copyrights 2020. Goldentexgroups.com. All rights reserved"
        
        
    }
    
    struct PersonalInfoKeys {
        
        static let header1 = "Registration"
        static let header2 = "Business Details"
        static let placeholder1 = "Full Name"
        static let placeholder2 = "Shop Name"
        static let header3 = "Business Category"
        static let placeholder3 = "Shop number & street name*"
        static let placeholder4 = "Area/Locality/Village*"
        static let placeholder5 = "legal Entity*"
        static let placeholder6 = "Name On CompanyPan*"
        static let placeholder7 = "Company Pan*"
        static let placeholder8 = "Aadhar Number*"
        static let placeholder9 = "Postal Code"
        
    }
       
       struct ProductScreenKeys {
           static let header = "Your account has been verified successfully!".localized
           static let description = "Dear Merchant Your Mobile Number has verified Successfully, Please click select product to proceed next".localized
           static let selectProduct = "Select Product".localized
       }
    
    
       
       struct SettingsScreenKeys {
           static let title1 = "PROFILE".localized
           static  let header1 = "Profile".localized
           static  let description1 = "View your Profile".localized
           static  let header2 = "Add User".localized
           static  let description2 = "Add New User".localized
           static let header3 = "Complaint & Feedback".localized
           static  let description3 = "Write Your Feedback".localized
           static let title2 = "SECURITY".localized
           static let header4 = "Change Mobile Number".localized
           static let description4 = "Change your login Mobile Number".localized
           static let header5 = "Change Password".localized
           static let description5 = "Change your login Password".localized
           static let header6 = "Logout".localized
           static let description6 = "Log out from your BasisPay account".localized
           static let header7 = "Clean Cache".localized
           static let description7 = "Clean Cache History".localized
           static let title3 = "LEGAL INFORMATION".localized
           static let header8 = "Terms and Conditions".localized
           static let description8 = "Read BasisPay Terms & Conditions".localized
           static let header9 = "Privacy Policy".localized
           static let description9 = "Read BasisPay Privacy Policy".localized
           static let header10 = "Frequently Asked Question".localized
           static let description10 = "Read FAQ".localized
           static let title4 = "APPLICATION".localized
           static let header11 = "Rate this App".localized
           static let description11 = "Rate this BasisPay QR App".localized
           static let header12 = "Share App".localized
           static let description12 = "Share the BasisPay QR App".localized
           static let header13 = "About App".localized
           static let description13 = "Version".localized
           
       }
       
    struct SelectProductScreenKeys {
        static let title1 = "QR".localized
        static let header1 = "UPI QR".localized
        static let setupFee = "Setup Fee :".localized
        static let amcFee = "AMC Fee   :".localized
        static let mmcFee = "MMC Fee   :".localized
        static let quantity = "No of stands"
        static let amcHeader = "AMC / MMC".localized
        static let paymentHeader = "Payment Mode".localized
        static let title2 = "Payment Gateway".localized
        static let header2 = "PG Easy".localized
        static let header3 = "PG Economy".localized
        static let submit = "Submit".localized
        static let amcDropDown = ["Monthly".localized,"Quarterly".localized,"Half yearly".localized,"Yearly".localized]
        static let paymentDropDown = ["A/C Transfer".localized,"Enach".localized]
    }
    
    struct ErrorNotificationPopupScreenKeys {
        static let header = "Error Notification".localized
        static let description = "You can't select  two products from the same category".localized
        static let button1 = "OK".localized
    }
    
    struct ProductSuccessScreenKeys {
        static let header = "Dear Merchant , Thank you for choosing Basispay".localized
        static let description = "Your Product has been added to your account".localized
        static let button1 = "Pay Now".localized
        static let button2 = "Skip & View Activity Board".localized
    }
    
    struct PGIntegrationKitScreenKeys {
        static let title = "PG Integration Kit".localized
        static let header1 = "Dear Merchant , Thank you for choosing Basispay PG".localized
        static let description1 = "Our team is working on your request to develop the test API & Salt Key. BasisPay will get back to you shortly in this regards If you have any queries please write us to support@basispay.in"
        static let header2 = "Dear Merchant, Greeting Basispay".localized
        static let description2 = "Please found below test API & Salt Key".localized
        static let parameterHeader1 = "Mode".localized
        static let parameterHeader2 = "API KEY".localized
        static let parameterHeader3 = "Salt KEY".localized
        static let disclaimer = "if you have any queries or difficulties in integration of above keys please write us to support@basispay:in".localized
        static let button1 = "Back to Activity Board".localized
        static let button2 = "Upgrade to live".localized
    }
    
    struct PGLiveInfoScreenScreenKeys {
        static let title = "PG Live Info".localized
        static let header1 = "Website Url".localized
        static let header2 = "Terms and condition Url".localized
        static let header3 = "Privacy Policy Url".localized
        static let header4 = "Developer Details".localized
        static let header5 = "About Business".localized
        static let screen2Header1 = "Approved Status:".localized
        static let screen2Header2 = "Remark:".localized
        static let button1 = "Update".localized
        static let button2 = "Resubmit".localized
    }
    
    struct SettlementBankScreenKeys {
        static let title = "Settlement Bank Details"
        static let header = "Bank Info"
        static let placeholder1 = "Account holder name *"
        static let placeholder2 = "Bank Name *"
        static let placeholder3 = "Account Number *"
        static let placeholder4 = "Confirmation Account Number *"
        static let placeholder5 = "IFSC Code *"
        static let placeholder6 = "Branch *"
        static let placeholder7 = "Account Type *"
        static let submit = "Submit"
        static let accountType = ["Savings Account","Current Account"]
    }
    
    struct BankInfoKeys {
        static let title = "Bank Info"
        static let approvedStatus = "Approved Status:"
        static let remarkStatus = "Remark:"
        static let bankDetails = "Bank Details"
        static let accountName = "Account Name"
        static let bankName = "Bank Name"
        static let accountNumber = "Account Number"
        static let ifscCode = "IFSC Code"
        static let branch = "Branch"
        static let addBankButton = "Add New Bank"
    }
    
    struct PaymentScreenKeys {
        static let title = "Payment Information"
        static let header1 = "Products"
        static let header2 = "Basispay Merchant app"
        static let setupFee = "Setup fee"
        static let qty = "QTY"
        static let name = "Name"
        static let amount = "Amount"
        static let total = "Total :"
        static let sgst = "SGST Charges (9%) :"
        static let cgst = "CGST Charges (9%) :"
        static let totalPay = "Total payable amount"
        static let paid = "Total paid amount"
        static let payNow = "Pay Now"
    }
    
    struct PaymentStatusScreenKeys {
        static let header1 = "Order Id"
        static let header2 = "Transaction Id"
        static let header3 = "Transaction Date&Time"
        static let header4 = "Payment Amount"
        static let header5 = "Payment Mode"
        static let header6 = "Payment Status"
    
    }
    
    
    struct DownloadQrScreenKeys {
        static let title = "Download QR"
        static let shopName = "SHOP NAME"
        static let downloadQR = "Download QR"
        static let shareQr = "Share Qr"
        static let note = "#note: Click on Download QR your Business QR image file downloaded for your device picture folder"
    }
    
    struct PersonalInfoEditScreenKeys {
        static let header1 = "Personal info".localized
        static let header2 = "Business Details".localized
        static let placeholder1 = "Full Name".localized
        static let placeholder2 = "Shop Name".localized
        static let header3 = "Business category"
        static let placeholder3 = "Shop number & street name*"
        static let placeholder4 = "Area/Locality/Village*"
        static let placeholder5 = "legal Entity*"
        static let placeholder6 = "Name On CompanyPan*"
        static let placeholder7 = "Company Pan*"
        static let placeholder8 = "Aadhar Number*"
        static let placeholder9 = "Postal Code"
        static let applyButton = "Save Changes"
    }
    
    struct AccountHistoryKeys {
        static let header1 = "Account History"
        static let applyButton = "Add User"
    }
    
    struct AddAccountKeys {
        static let placeholder1 = "Username"
        static let placeholder2 = "Mobile Number"
    }
    
    
    
    //MARK: - ImageKeys
       struct ImageNames {
           
           struct OnboardingImageNames {
               static let splash1 = "expOneImg"
               static let splash2 = "expTwoImg"
               static let splash3 = "imgThree"
               static let splash4 = "splash4"
               static let splash5 = "splash5"
           }
           struct LoginImageNames {
               static let checkBox = "checkbox"
               static let unCheckBox = "uncheckbox"
           }
          
           struct SettingsImageNames {
                  static let image1 = UIImage(named: "settingsIcon1")!
                  static let image2 = UIImage(named: "settingsIcon2")!
                  static let image3 = UIImage(named: "settingsIcon3")!
                  static let image4 = UIImage(named: "settingsIcon4")!
                  static let image5 = UIImage(named: "settingsIcon5")!
                  static let image6 = UIImage(named: "settingsIcon6")!
                  static let image7 = UIImage(named: "settingsIcon7")!
                  static let image8 = UIImage(named: "settingsIcon8")!
                  static let image9 = UIImage(named: "settingsIcon9")!
                  static let image10 = UIImage(named: "settingsIcon10")!
                  static let image11 = UIImage(named: "settingsIcon11")!
                  static let image12 = UIImage(named: "settingsIcon12")!
                  static let image13 = UIImage(named: "settingsIcon13")!
              }
        
        struct ActivityBoardImageNames {
            static let icon1 = UIImage(named: "ActivityIcon1")!
            static let icon2 = UIImage(named: "ActivityIcon2")!
            static let icon3 = UIImage(named: "ActivityIcon3")!
            static let icon4 = UIImage(named: "ActivityIcon4")!
            static let icon5 = UIImage(named: "ActivityIcon2")!
            static let icon6 = UIImage(named: "ActivityIcon6")!
            static let pending = UIImage(named: "info")!
            static let approved = UIImage(named: "approved")!
            static let rejected = UIImage(named: "rejected")!
        }
        static let blueCalendarIcon = UIImage(named: "blueCalender")!
           static let redCalendarIcon = UIImage(named: "redCalendar")!
           static let profilePicImage = UIImage(named: "ProfilePic")!
           static let userImage  = UIImage(named: "user")!
           static let deleteImage  = UIImage(named: "delete")!
          static let timeIcon  = UIImage(named: "time")!
           static let productImage = UIImage(named: "product")!
           static let otpImage = UIImage(named: "otp")!
           static let lockImage = UIImage(named: "lock")!
           static let SettlementsImage = "settlements.png"
           static let UploadImage = UIImage(named: "upload")!
           static let viewImage = UIImage(named: "view")
            static let flag = UIImage(named: "flag")!
           static let invisibleEye = UIImage(named: "Invisible")!
           static let visibleEye = UIImage(named: "visible")!
           static let backButton = UIImage(named: "back")!
       }
    struct FontName {
        static let Icomoon = "icomoon"
    }
    
    struct Authkeys{
        static let username2 = "admin"
        static let password2 = "TestVijay#2020"
    }
    
    struct BaseURL {
        static let constantUrl = "https://www.api.fusionkitchen.co.uk/"
     //   static let constantUrl = "https://www.dev.fusionkitchen.co.uk/"
        static let DevelopmentUrl = "http://192.168.0.104:8080/"
        static let constantLiveUrl = "https://www.api.fusionkitchen.co.uk/"
    }
    
    struct DecryptKeys {
        static let BasicAuthKey = "Basic VGVzdGluZzpUZXN0QDk4Nw=="
    }
    
    struct FileName {
        static let LocalStorage = "localStorage.plist"
    }
    
    
    
    struct UserDetailsKeys {
        static let businessCategoryId = "businessCategoryId"
        static let businessCategory = "businessCategory"
        static let categoryId = "categoryId"
        static let id = "id"
        static let stateId = "stateId"
        static let kycDocumentList = "kycDocumentList"
        static let merchantEmailAddress = "merchantEmailAddress"
        static let merchantId = "merchantId"
        static let merchantMobile = "merchantMobile"
        static let merchantName = "merchantName"
        static let merchantCode = "merchantCode"
        static let merchantStatus = "merchantStatus"
        static let message = "message"
       
    }
    
    struct ProfileDetailsKeys {
        static let merchantName = "merchantName"
        static let shopStreetName = "shopStreetName"
        static let shopName = "shopName"
        static let merchantEmailAddress = "merchantEmailAddress"
        static let merchantMobile = "merchantMobile"
        static let cityName = "cityName"
        static let stateName = "stateName"
        static let pinCode = "pinCode"
        static let shopAreaName = "shopAreaName"
        static let stateId = "stateId"
        static let cityId = "cityId"
        static let businessCategoryId = "businessCategoryId"
        static let businessCategory = "businessCategory"
        static let legalEntity = "legalEntity"
        static let companyPan = "companyPan"
        static let nameOnCompanyPan = "nameOnCompanyPan"
        static let aadharNumber = "aadharNumber"
    }
    
    struct ProductDetailsKeys {
        static let productName = "productName"
        static let productId = "id"
        static let mmcFee = "mmcFee"
        static let amcFee = "amcFee"
        static let setupFee = "setupFee"
        static let productCategoryId = "productCategoryId"
        static let paymentRefNo = "paymentRefNo"
        static let quantity = "quantity"
        static let productStandAmount = "productStandAmount"
    }
    
    struct PaymentGatewayKeys {

        static let apiKey = "79e111fb-098d-4730-8c3a-17fe0c30738a"
        static let saltKey = "69ecafcf78912a3f57a00f0e78ea4194efcd7d24"
        static let returnUrl = "http://159.65.148.139/rest/mcpayment/pgdetails"
    }
    
    struct FontSize {
        static let SmallIcon: CGFloat = 18
        static let MediumIcon: CGFloat = 22
        static let NormalIcon: CGFloat = 24
        static let RegularIcon: CGFloat = 28
        static let LargeIcon: CGFloat = 32
        static let VeryLargeIcon: CGFloat = 85
        static let SmallText: CGFloat = 14
        static let VerySmallText: CGFloat = 12
        static let VeryVerySmallText: CGFloat = 10
        static let GraphSmallestText: CGFloat = 8
        static let RegularText: CGFloat = 16
        static let LargeText: CGFloat = 18
        static let LargestText: CGFloat = 20
        static let VeryLargeText: CGFloat = 40
        static let ButtonTitleText: CGFloat = 20
        static let LargeButtonTitleText: CGFloat = 28
        static let BorderWidth : CGFloat = 1
    }
    struct FontNames {
        static let RobotoExtraBoldBig =  UIFont(name: "Roboto-Black", size: 30)
        static let karlaHeaderBold =  UIFont(name: "Karla-Bold", size: 25)
        static let karlaHeader2Bold =  UIFont(name: "Karla-Bold", size: 22)
        static let karlaHeader2BoldSmall =  UIFont(name: "Karla-Bold", size: 19)
        static let karlaHeader3Bold =  UIFont(name: "Karla-Bold", size: 16)
        static let karlaRegular = UIFont(name: "Karla-Regular", size: 16)
        static let karlaRegularHuge = UIFont(name: "Karla-Regular", size: 22)
        static let karlaRegularLarge = UIFont(name: "Karla-Regular", size: 19)
        static let karlaRegularSmall = UIFont(name: "Karla-Regular", size: 14)
        static let RobotoBold = UIFont(name: "Roboto-BoldItalic", size: 20)
        static let RobotoBoldSmall = UIFont(name: "Roboto-Black", size: 13)
        static let RobotoBoldMedium = UIFont(name: "Roboto-Black", size: 17)
        static let RobotoBoldBig = UIFont(name: "Roboto-Black", size:22)
        static let RobotoRegularBig = UIFont(name: "Roboto-Regular", size: 17)
        static let RobotoRegular = UIFont(name: "Roboto-Regular", size: 28)
        static let RobotoMediumBig = UIFont(name: "Roboto-Medium", size: 20)
        static let RobotoThin = UIFont(name: "Roboto-Thin", size: 13)
        static let RobotoThinSml = UIFont(name: "Roboto-Medium", size: 13)
        static let RobotoThinExtraSml = UIFont(name: "Roboto-Medium", size: 10)
        static let HindVadoraSemiBold = UIFont(name: "HindVadodara-SemiBold", size: 17)
        static let HindVadoraBold = UIFont(name: "HindVadodara-Bold", size: 15)
        static let RobotoLight = UIFont(name: "Roboto-Light", size: 12)
        static let RobotoLightMedium = UIFont(name: "Roboto-Light", size: 15)

        static let HindVadoraMedium = UIFont(name: "HindVadodara-Medium", size: 13)
        static let RobotoMedium = UIFont(name: "Roboto-Medium", size: 13)
        static let RobotoMediumNext = UIFont(name: "Roboto-Medium", size: 16)
        static let RobotoRegularMediumNxt = UIFont(name: "Roboto-Regular", size: 17)
        static let HindVadoraBoldNxt = UIFont(name: "HindVadodara-Bold", size: 17)
        static let RobotoRegularMedium = UIFont(name: "Roboto-Regular", size: 14)
        static let HindVadoraBoldBig = UIFont(name: "HindVadodara-Bold", size: 20)
        static let HindVadoraBoldMedium = UIFont(name: "HindVadodara-Bold", size: 18)
        static let PoppinsMedium = UIFont(name: "Poppins-Medium", size: 13)
        static let PoppinsMediumNxt = UIFont(name: "Poppins-Medium", size: 17)

        static let PopponsSemiBold = UIFont(name: "Poppins-SemiBold", size: 13)
        static let PoppinsSemiBoldSml = UIFont(name: "Poppins-SemiBold", size: 10)
        static let HindVadoraMediumNxt = UIFont(name: "HindVadodara-Medium", size: 17)
        static let HindVadoraMediumBig = UIFont(name: "HindVadodara-Medium", size: 20)



        
        
    }
    
    struct Color {
        static let appDarkThemeColor = UIColor(named:"AppDarkThemeColor")!
        static let appLightThemeColor = UIColor(named:"AppLightThemeColor")!
        static let blueThemeColor = UIColor(named:"BlueThemeColor")!
        static let greenThemeColor = UIColor(named:"GreenColor")!
        static let darkGreyColor = UIColor(named:"DarkGreyColor")!
        static let redThemeColor = UIColor(named:"RedThemeColor")!
        static let yellowThemeColor = UIColor(named:"YellowThemeColor")!
        static let yellowColor = UIColor(named: "Yellow")!
        
        static let Black = UIColor.black
        static let White = UIColor.white
        static let Clear = UIColor.clear
        static let Red = UIColor.red
        static let Green = UIColor.green
        static let LightGray = UIColor.lightGray
        static let Gray = UIColor.gray
        static let Yellow = UIColor.yellow
        static let Blue = UIColor.blue
        static let LightBlackColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        static let LightWhiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        static let StatusBarColor = UIColor(red: 165/255, green: 1/255, blue: 20/255, alpha: 1)
        static let AppOrangeColor = UIColor(red: 227/255, green: 165/255, blue: 80/255, alpha: 1)
        static let AppPinkColor = UIColor(red: 255/255, green: 67/255, blue: 94/255, alpha: 1)
        static let AppGrayColor = UIColor(red: 89/255, green: 89/255, blue: 89/255, alpha: 1)
        static let AppGreenColor = UIColor(red: 100/255, green: 165/255, blue: 0/255, alpha: 1)
        static let AppBlueColor = UIColor(red: 10/255, green: 100/255, blue: 120/255, alpha: 1)
        static let AppRedColor = UIColor(red: 200/255, green: 40/255, blue: 0/255, alpha: 1)
        static let AppYellowColor = UIColor(red: 250/255, green: 140/255, blue: 10/255, alpha: 1)
    }
    
    
    
    struct Numerals {
        static let NotificationButtonHeight = 30
        static let NotificationButtonWidth = 45
        static let Spacing = 10
        static let MobileLength = 11
        static let OtpMaxLength = 6
        static let pinCodeLength = 6
        static let MaxTextFieldLength = 60
        static let DescriptionLength = 180
        static let PinCount = 6
        static let businessOwnerName = 30
        static let shopName = 80
        static let shopNumber = 50
        static let area = 50
        static let panLength = 10
        static let nameOnCompanyLength = 20
        static let aadhaarLength = 12
        static let passwordLength = 15
        static let accountHolderName = 30
        static let accountNumber = 18
        static let confirmAccountNumber = 18
        static let bankname = 30
        static let branchName = 30
        static let ifscCode = 11
        static let websiteUrlLength = 80
    }
    
    struct NetworkStatus {
        static let Online = "Online"
        static let Offline = "Offline"
    }
    
    struct Image {
        static let LoadingImage = "loadingImage.png"
        static let BasispayLogoImage = "logo.png"
        static let TransactionsImage = "transactions.png"
        static let SettlementsImage = "settlements.png"
        static let UploadImage = "upload.png"
    }
    
    struct UserDefaultkeys {
        static let finalMailId = "finalMailId"
        static let locatingAddres = "locatingAddres"
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let area = "area"
        static let setPostCode = "setPostCode"
        static let takeMode = "takeModa"
        static let takeCid = "cid"
        static let takeVode = "vcode"
        static let gmail = "mail"
        static let fname = "fname"
        static let lname = "lname"
        static let gooId = "gooId"
        static let fbgmail = "fbgmail"
        static let fbfname = "fbfname"
        static let fblname = "fblname"
        static let fbId = "fbID"
        static let takeFbCid = "fbcid"
        static let takeFbVode = "fbvcode"
        static let takeMailCid = "googlecid"
        static let takeMailVode = "googlevcode"
        static let typeOfLogin = "typeOfLogin"
        static let cartPageOrderMode = "cartOrderMode"
        static let cookingInstruction = "cookingInstruction"
        static let deliveryPostCode = "deliveryPostCode"
        
        static let merchantDetails = "merchantDetails"
        static let profileDetails = "profileDetails"
        static let userDetails = "userDetails"
        static let productDetails = "productDetails"
        static let pgRequestStatus = "pgRequestStatus"
        static let productkeyId = "keyId"
        static let stateId = "stateId"
        static let productType = "productType"
        static let qrEnabled = "qrEnabled"
        static let isDashboardEnabled = "isDashboardEnabled"
        static let isChildAccountEnabled = "isChildAccountEnabled"
        static let qrImage = "qrImage"
        static let productStandQuantity = "productStandQuantity"
        static let distributeId = "distributeId"

    }
    
   
    
    struct Time {
        static let WebTimeInterval = 30
        static let OtpTimer = 180
    }
    
    struct Labels {
        static let Success = "SUCCESS"
        static let Failure = "FAILURE"
    }
    
    struct AlertTitle {
        static let Info = "Info"
        static let Alert = "Alert"
        static let Success = "Success"
        static let Logout = "Logout"
        static let Options = "Options"
        static let Failure = "Failure"
        static let Cancelled = "Cancelled"
    }
    
    struct AlertButton {
        static let Ok = "Ok"
        static let Yes = "Yes"
        static let No = "No"
        static let Cancel = "Cancel"
        static let Close = "Close"
        static let Confirm = "Confirm"
        static let Verify = "Verify"
        static let Continue = "Continue"
    }
    
    struct HudLabel {
        static let Loading = "Loading"
    }
    
    struct CharacterSet {
        static let Alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        static let AlphabetsWithSpace = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
        static let MobileCharacters = "0123456789+-()"
        static let Decimals = "0123456789."
        static let Numbers = "0123456789"
    }
    

    struct ModalView{
        static let Month = "Month"
        static let Year = "Year"
    }
    
    struct DateFormat {
        static let ThreeLetterMonthFormat = "MMM"
        static let TwoLetterMonthFormat = "MM"
        static let YearFormat = "yyyy"
        static let LongDateTimeFormat = "dd MMMM, yyyy hh:mm a"
        static let UTCDateFormat = "yyyy-MM-dd HH:mm:ss.S"
        static let DateFormat = "dd MMMM, yyyy"
        static let TimeFormat = "hh:mm a"
    }
    
    struct WebViewType {
        static let TermsConditionsUrl = "http://167.71.229.193:8080/terms-conditions"
        static let PrivacyPolicy = "http://167.71.229.193:8080/complaint-policy"
        static let FAQ = "http://167.71.229.193:8080/faq-qr"
        static let appStore = "https://apps.apple.com/us/app/id1504454948"
        static let checkVersion = "https://apps.apple.com/in/app/basispay-qr/id"
    }
    struct PreOrderKeys {
        static let preOrderDate = "preOrderDate"
        static let preOrderTime = "preOrderTime"
        static let preOrderMethod = "preOrderMethod"
    }
}


