/*
 * Copyright 2019-2020 Shi0n All rights reserved.
 * Author: Shi0n @UI0x01
 * Last updated: 28 April, 2020
 */

struct AuthSessionRequest {
    1: map<string, string> metaData;
}

struct E2EEPublicKey {
    1: i32 version;
    2: i32 keyId;
    4: binary keyData;
    5: i64 createdTime;
}

struct SecurityCenterResult {
    1: string uri;
    2: string token;
    3: string cookiePath;
    4: bool skip;
}

enum ResponseType {
    UNKNOWN = 0,
    SUCCESS = 1,
    REQUIRE_SERVER_SIDE_EMAIL = 2,
    REQUIRE_CLIENT_SIDE_EMAIL = 3
}

struct IdentityCredentialResponse {
    1: map<string, string> metaData;
    2: ResponseType responseType;
    3: string confirmationVerifier;
    4: i64 timeoutInSeconds;
}

enum IdentityProvider {
    UNKNOWN = 0,
    LINE = 1,
    NAVER_KR = 2,
    LINE_PHONE = 3
}

struct IdentifierConfirmationRequest {
    1: map<string, string> metaData;
    2: bool forceRegistration;
    3: string verificationCode;
}

struct IdentityCredentialRequest {
    1: map<string, string> metaData;
    2: IdentityProvider identityProvider;
    3: string cipherKeyId;
    4: string cipherText;
    5: IdentifierConfirmationRequest confirmationRequest;
}

struct RSAKey {
    1: string keynm;
    2: string nvalue;
    3: string evalue;
    4: string sessionKey;
}

struct AuthKeyExchangeResponse {
    1: string publicKey;
    2: string nonce;
}

enum AuthKeyVersion {
    UNKNOWN = 0,
    V1 = 1
}

struct AuthKeyExchangeRequest {
    1: AuthKeyVersion authKeyVersion;
    2: string publicKey;
    3: string nonce;
}

struct AuthLoginResponse {
    1: map<string, string> metaData;
    2: string cipherText;
}

enum AuthLoginVersion {
    UNKNOWN = 0,
    V1 = 1,
    V2 = 2
}

struct AuthLoginRequest {
    1: AuthLoginVersion authLoginVersion;
    2: map<string, string> metaData;
    3: string cipherText;
}

enum LoginResultType {
    SUCCESS = 1,
    REQUIRE_QRCODE = 2,
    REQUIRE_DEVICE_CONFIRM = 3,
    REQUIRE_SMS_CONFIRM = 4
}

enum VerificationMethod {
    NO_AVAILABLE = 0,
    PIN_VIA_SMS  = 1,
    CALLERID_INDIGO = 2,
    PIN_VIA_TTS = 4,
    SKIP = 10
}

struct VerificationSessionData {
    1: string sessionId;
    2: VerificationMethod method;
    3: string callback;
    4: string normalizedPhone;
    5: string countryCode;
    6: string nationalSignificantNumber;
    7: list<VerificationMethod> availableVerificationMethods;
    8: string callerIdMask;
}

struct TokenIssueResult {
    1: string accessToken;
    2: string refreshToken;
    3: string appId;
}

struct LoginResult {
    1: string authToken;
    2: string certificate;
    3: string verifier;
    4: string pinCode;
    5: LoginResultType type;
    6: i64 lastPrimaryBindTime;
    7: string displayMessage;
    8: VerificationSessionData sessionForSMSConfirm;
    9: TokenIssueResult tokenIssueResult;
}

enum LoginType {
    ID_CREDENTIAL = 0,
    QRCODE = 1,
    ID_CREDENTIAL_WITH_E2EE = 2
}

struct LoginRequest {
    1: LoginType type;
    2: IdentityProvider identityProvider;
    3: string identifier;
    4: string password;
    5: bool keepLoggedIn;
    6: string accessLocation;
    7: string systemName;
    8: string certificate;
    9: string verifier;
    10: binary secret;
    11: i32 e2eeVersion;
}

enum ErrorCode {
    ILLEGAL_ARGUMENT = 0,
    AUTHENTICATION_FAILED = 1,
    DB_FAILED = 2,
    INVALID_STATE = 3,
    EXCESSIVE_ACCESS = 4,
    NOT_FOUND = 5,
    INVALID_LENGTH = 6,
    NOT_AVAILABLE_USER = 7,
    NOT_AUTHORIZED_DEVICE = 8,
    INVALID_MID = 9,
    NOT_A_MEMBER = 10,
    INCOMPATIBLE_APP_VERSION = 11,
    NOT_READY = 12,
    NOT_AVAILABLE_SESSION = 13,
    NOT_AUTHORIZED_SESSION = 14,
    SYSTEM_ERROR = 15,
    NO_AVAILABLE_VERIFICATION_METHOD = 16,
    NOT_AUTHENTICATED = 17,
    INVALID_IDENTITY_CREDENTIAL = 18,
    NOT_AVAILABLE_IDENTITY_IDENTIFIER = 19,
    INTERNAL_ERROR = 20,
    NO_SUCH_IDENTITY_IDENFIER = 21,
    DEACTIVATED_ACCOUNT_BOUND_TO_THIS_IDENTITY = 22,
    ILLEGAL_IDENTITY_CREDENTIAL = 23,
    UNKNOWN_CHANNEL = 24,
    NO_SUCH_MESSAGE_BOX = 25,
    NOT_AVAILABLE_MESSAGE_BOX = 26,
    CHANNEL_DOES_NOT_MATCH = 27,
    NOT_YOUR_MESSAGE = 28,
    MESSAGE_DEFINED_ERROR = 29,
    USER_CANNOT_ACCEPT_PRESENTS = 30,
    USER_NOT_STICKER_OWNER = 32,
    MAINTENANCE_ERROR = 33,
    ACCOUNT_NOT_MATCHED = 34,
    ABUSE_BLOCK = 35,
    NOT_FRIEND = 36,
    NOT_ALLOWED_CALL = 37,
    BLOCK_FRIEND = 38,
    INCOMPATIBLE_VOIP_VERSION = 39,
    INVALID_SNS_ACCESS_TOKEN = 40,
    EXTERNAL_SERVICE_NOT_AVAILABLE = 41,
    NOT_ALLOWED_ADD_CONTACT = 42,
    NOT_CERTIFICATED = 43,
    NOT_ALLOWED_SECONDARY_DEVICE = 44,
    INVALID_PIN_CODE = 45,
    NOT_FOUND_IDENTITY_CREDENTIAL = 46,
    EXCEED_FILE_MAX_SIZE = 47,
    EXCEED_DAILY_QUOTA = 48,
    NOT_SUPPORT_SEND_FILE = 49,
    MUST_UPGRADE = 50,
    NOT_AVAILABLE_PIN_CODE_SESSION = 51,
    EXPIRED_REVISION = 52,
    NOT_YET_PHONE_NUMBER = 54,
    BAD_CALL_NUMBER = 55,
    UNAVAILABLE_CALL_NUMBER = 56,
    NOT_SUPPORT_CALL_SERVICE = 57,
    CONGESTION_CONTROL = 58,
    NO_BALANCE = 59,
    NOT_PERMITTED_CALLER_ID = 60,
    NO_CALLER_ID_LIMIT_EXCEEDED = 61,
    CALLER_ID_VERIFICATION_REQUIRED = 62,
    NO_CALLER_ID_LIMIT_EXCEEDED_AND_VERIFICATION_REQUIRED = 63,
    MESSAGE_NOT_FOUND = 64,
    INVALID_ACCOUNT_MIGRATION_PINCODE_FORMAT = 65,
    ACCOUNT_MIGRATION_PINCODE_NOT_MATCHED = 66,
    ACCOUNT_MIGRATION_PINCODE_BLOCKED = 67,
    INVALID_PASSWORD_FORMAT = 69,
    FEATURE_RESTRICTED = 70,
    MESSAGE_NOT_DESTRUCTIBLE = 71,
    PAID_CALL_REDEEM_FAILED = 72,
    PREVENTED_JOIN_BY_TICKET = 73,
    SEND_MESSAGE_NOT_PERMITTED_FROM_LINE_AT = 75,
    SEND_MESSAGE_NOT_PERMITTED_WHILE_AUTO_REPLY = 76,
    SECURITY_CENTER_NOT_VERIFIED = 77,
    SECURITY_CENTER_BLOCKED_BY_SETTING = 78,
    SECURITY_CENTER_BLOCKED = 79,
    TALK_PROXY_EXCEPTION = 80,
    E2EE_INVALID_PROTOCOL = 81,
    E2EE_RETRY_ENCRYPT = 82,
    E2EE_UPDATE_SENDER_KEY = 83,
    E2EE_UPDATE_RECEIVER_KEY = 84,
    E2EE_INVALID_ARGUMENT = 85,
    E2EE_INVALID_VERSION = 86,
    E2EE_SENDER_DISABLED = 87,
    E2EE_RECEIVER_DISABLED = 88,
    E2EE_SENDER_NOT_ALLOWED = 89,
    E2EE_RECEIVER_NOT_ALLOWED = 90,
    E2EE_RESEND_FAIL = 91,
    E2EE_RESEND_OK = 92,
    HITOKOTO_BACKUP_NO_AVAILABLE_DATA = 93,
    E2EE_UPDATE_PRIMARY_DEVICE = 94,
    SUCCESS = 95,
    CANCEL = 96,
    E2EE_PRIMARY_NOT_SUPPORT = 97,
    E2EE_RETRY_PLAIN = 98,
    E2EE_RECREATE_GROUP_KEY = 99,
    E2EE_GROUP_TOO_MANY_MEMBERS = 100,
    SERVER_BUSY = 101,
    NOT_ALLOWED_ADD_FOLLOW = 102,
    INCOMING_FRIEND_REQUEST_LIMIT = 103,
    OUTGOING_FRIEND_REQUEST_LIMIT = 104,
    OUTGOING_FRIEND_REQUEST_QUOTA = 105,
    DUPLICATED = 106,
    BANNED = 107,
    NOT_AN_INVITEE = 108,
    NOT_AN_OUTSIDER = 109,
    AGE_CHECK_REQUIRED = 110,
    EMPTY_GROUP = 111,
    EXCEED_FOLLOW_LIMIT = 112,
    UNSUPPORTED_ACCOUNT_TYPE = 113
}

exception TalkException {
    1: ErrorCode code;
    2: string reason;
    3: map<string, string> parameterMap;
}

struct CallHost {
    1: string host;
    2: i32 port;
    3: string zone;
}

enum GroupCallProtocol  {
    STANDARD = 1,
    CONSTELLA = 2
}

struct GroupCallRoute {
    1: string token;
    2: CallHost cscf;
    3: CallHost mix;
    4: string hostMid;
    5: list<string> capabilities;
    6: GroupCallProtocol proto;
    7: string voipAddress;
    8: i32 voipUdpPort;
    9: i32 voipTcpPort;
    10: string fromZone;
    11: string commParam;
    12: string polarisAddress;
    13: i32 polarisUdpPort;
    14: string polarisZone;
    15: string orionAddress;
}

enum GroupCallMediaType {
    AUDIO = 1,
    VIDEO = 2,
    LIVE = 3
}

enum CallFlowType {
    NEW = 1,
    PLANET = 2
}

struct CallRoute {
    1: string fromToken;
    2: CallFlowType callFlowType;
    3: string voipAddress;
    4: i32 voipUdpPort;
    5: i32 voipTcpPort;
    6: string fromZone;
    7: string toZone;
    8: bool fakeCall;
    9: string ringbackTone;
    10: string toMid;
    11: string tunneling;
    12: string commParam;
}

enum FreeCallType {
    AUDIO = 1,
    VIDEO = 2,
    FACEPLAY = 3
}

enum PaidCallType {
     OUT = 0,
     IN = 1,
     TOLLFREE = 2,
     RECORD = 3,
     AD = 4,
     CS = 5,
     OA = 6
}

enum PaidCallProductType {
    COIN = 0,
    CREDIT = 1,
    MONTHLY = 2
}

enum PaidCallerIdStatus {
    NOT_SPECIFIED = 0,
    VALID = 1,
    VERIFICATION_REQUIRED = 2,
    NOT_PERMITTED = 3,
    LIMIT_EXCEEDED = 4,
    LIMIT_EXCEEDED_AND_VERIFICATION_REQUIRED = 5
}

struct PaidCallDialing {
    1: PaidCallType type;
    2: string dialedNumber;
    3: string serviceDomain;
    4: PaidCallProductType productType;
    5: string productName;
    6: bool multipleProduct;
    7: PaidCallerIdStatus callerIdStatus;
    10: i32 balance;
    11: string unit;
    12: i32 rate;
    13: string displayCode;
    14: string calledNumber;
    15: string calleeNationalNumber;
    16: string calleeCallingCode;
    17: string rateDivision;
    20: i32 adMaxMin;
    21: i32 adRemains;
    22: string adSessionId;
}

struct PaidCallRedeemResult {
    1: string eventName;
    2: i32 eventAmount;
}

enum SpotItemCategory {
    UNKNOWN = 0,
    GOURMET = 1,
    BEAUTY = 2,
    TRAVEL = 3,
    SHOPPING = 4,
    ENTERTAINMENT = 5,
    SPORTS = 6,
    TRANSPORT = 7,
    LIFE = 8,
    HOSPITAL = 9,
    FINANCE = 10,
    EDUCATION = 11,
    OTHER = 12,
    ALL = 10000
}

struct SpotItem {
    2: string name;
    3: string phone;
    4: SpotItemCategory category;
    5: string mid;
    6: string countryAreaCode;
    10: i64 freePhoneCallable;
}

struct PaidCallResponse {
    1: CallHost host;
    2: PaidCallDialing dialing;
    3: string token;
    4: list<SpotItem> spotItems;
}

struct TestCallRoute {
    1: string token;
    2: CallHost voipServer;
}

struct PaymentReservationResult {
    1: string orderId;
    2: string confirmUrl;
    3: map<string, string> extras;
}

enum PaymentType {
    PAYMENT_APPLE = 1,
    PAYMENT_GOOGLE = 2
}

enum PaymentPgType {
    PAYMENT_PG_NONE = 0,
    PAYMENT_PG_AU = 1,
    PAYMENT_PG_AL = 2
}

struct CoinPurchaseReservation {
    1: string productId;
    2: string country;
    3: string currency;
    4: string price;
    5: PaymentType appStoreCode;
    6: string language;
    7: PaymentPgType pgCode;
    8: string redirectUrl;
}

struct GroupCall {
    1: bool online;
    2: string chatMid;
    3: string hostMid;
    4: list<string> memberMids;
    5: i64 started;
    6: GroupCallMediaType mediaType;
    7: GroupCallProtocol  protocol;
}

struct CoinProductItem {
    1: string itemId;
    2: i32 coin;
    3: i32 freeCoin;
    5: string currency;
    6: string price;
    7: string displayPrice;
    8: string name;
    9: string desc;
}

struct PaidCallHistory {
    1: i64 seq;
    2: PaidCallType type;
    3: string dialedNumber;
    4: string calledNumber;
    5: string toMid;
    6: string toName;
    7: i64 setupTime;
    8: i64 startTime;
    9: i64 endTime;
    10: i64 duration;
    11: i32 terminate;
    12: PaidCallProductType productType;
    13: i32 charge;
    14: string unit;
    15: string result;
}

struct PaidCallHistoryResult {
    1: list<PaidCallHistory> historys;
    2: bool hasNext;
}

struct PaidCallAdResult {
    1: i32 adRemains;
}

struct PaidCallUserRate {
    1: string countryCode;
    2: i32 rate;
    3: string rateDivision;
    4: string rateName;
}

enum PayloadType {
    PAYLOAD_BUY = 101,
    PAYLOAD_CS = 111,
    PAYLOAD_BONUS = 121,
    PAYLOAD_EVENT = 131,
    PAYLOAD_POINT_AUTO_EXCHANGED = 141,
    PAYLOAD_POINT_MANUAL_EXCHANGED = 151
}

struct CoinPayLoad {
    1: i32 payCoin;
    2: i32 freeCoin;
    3: PayloadType type;
    4: i32 rewardCoin;
}

struct CoinHistory {
    1: i64 payDate;
    2: i32 coinBalance;
    3: i32 coin;
    4: string price;
    5: string title;
    6: bool refund;
    7: string paySeq;
    8: string currency;
    9: string currencySign;
    10: string displayPrice;
    11: CoinPayLoad payload;
    12: string channelId;
}

struct Coin {
    1: i32 freeCoinBalance;
    2: i32 payedCoinBalance;
    3: i32 totalCoinBalance;
    4: i32 rewardCoinBalance;
}

struct CoinHistoryResult {
    1: list<CoinHistory> historys;
    2: Coin balance;
    3: bool hasNext;
}

struct CoinHistoryCondition {
    1: i64 start;
    2: i32 size;
    3: string language;
    4: string eddt;
    5: PaymentType appStoreCode;
}

struct PaidCallCurrencyExchangeRate {
    1: string currencyCode;
    2: string currencyName;
    3: string currencySign;
    4: bool preferred;
    5: string coinRate;
    6: string creditRate;
}

struct PaidCallAdCountry {
    1: string countryCode;
    2: string rateDivision;
}

struct PaidCallMetadataResult {
    1: list<PaidCallCurrencyExchangeRate> currencyExchangeRates;
    2: list<string> recommendedCountryCodes;
    3: list<PaidCallAdCountry> adCountries;
    4: list<string> supportedCalledCountryCodes;
}

struct PaidCallBalance {
    1: PaidCallProductType productType;
    2: string productName;
    3: string unit;
    4: i32 limitedPaidBalance;
    5: i32 limitedFreeBalance;
    6: i32 unlimitedPaidBalance;
    7: i32 unlimitedFreeBalance;
    8: i64 startTime;
    9: i64 endTime;
    10: bool autopayEnabled;
}

struct ChannelToken {
    1: string token;
    2: string obsToken;
    3: i64 expiration;
    4: string refreshToken;
    5: string channelAccessToken;
}

struct WebLoginResponse {
     1: string returnUrl;
     2: string optionalReturnUrl;
     3: string redirectConfirmationPageUrl;
}

struct WebLoginRequest {
    1: string hookedFullUrl;
    2: string sessionString;
    3: bool fromIAB;
    4: string sourceApplication;
}

struct ChannelProvider {
    1: string name;
    2: bool certified;
}

enum PublicType {
    HIDDEN = 0,
    PUBLIC = 1000
}

enum ChannelConfiguration {
    MESSAGE = 0,
    MESSAGE_NOTIFICATION = 1,
    NOTIFICATION_CENTER = 2
}

enum ChannelPermission {
    PROFILE = 0,
    FRIENDS = 1,
    GROUP = 2
}

struct ChannelDomain {
    1: string host;
    2: bool removed;
}

enum ChannelFeatureLicense {
    BLE_LCS_API_USABLE = 26,
    PROHIBIT_MINIMIZE_CHANNEL_BROWSER = 27,
    ALLOW_IOS_WEBKIT = 28,
    PURCHASE_LCS_API_USABLE = 38,
    ALLOW_ANDROID_ENABLE_ZOOM = 48
}

struct ChannelInfo {
    1: string channelId;
    3: string name;
    4: string entryPageUrl;
    5: string descriptionText;
    6: ChannelProvider provider;
    7: PublicType publicType;
    8: string iconImage;
    9: list<string> permissions;
    11: string iconThumbnailImage;
    12: list<ChannelConfiguration> channelConfigurations;
    13: bool lcsAllApiUsable;
    14: set<ChannelPermission> allowedPermissions;
    15: list<ChannelDomain> channelDomains;
    16: i64 updatedTimestamp;
    17: set<ChannelFeatureLicense> featureLicenses;
}

struct RequestTokenResponse {
    1: string requestToken;
    2: string returnUrl;
}

struct ApprovedChannelInfo {
    1: ChannelInfo channelInfo;
    2: i64 approvedAt;
}

struct ApprovedChannelInfos {
    1: list<ApprovedChannelInfo> approvedChannelInfos;
    2: i64 revision;
}

struct CoinUseReservationItem {
    1: string itemId;
    2: string itemName;
    3: i32 amount;
}

struct CoinUseReservation {
    1: string channelId;
    2: string shopOrderId;
    3: PaymentType appStoreCode;
    4: list<CoinUseReservationItem> items;
    5: string country;
}

struct ChannelDomains {
    1: list<ChannelDomain> channelDomains;
    2: i64 revision;
}

struct ChannelIdWithLastUpdated {
    1: string channelId;
    2: i64 lastUpdated;
}

struct ChannelNotificationSetting {
    1: string channelId;
    2: string name;
    3: bool notificationReceivable;
    4: bool messageReceivable;
    5: bool showDefault;
}

struct ChannelSettings {
    1: bool unapprovedMessageReceivable;
}

enum ChannelErrorCode {
    ILLEGAL_ARGUMENT = 0,
    INTERNAL_ERROR = 1,
    CONNECTION_ERROR = 2,
    AUTHENTICATIONI_FAILED = 3,
    NEED_PERMISSION_APPROVAL = 4,
    COIN_NOT_USABLE = 5,
    WEBVIEW_NOT_ALLOWED = 6
}

exception ChannelException {
    1: ChannelErrorCode code;
    2: string reason;
    3: map<string, string> parameterMap;
}

enum AvailableChatType {
    PERSONAL = 1,
    ROOM = 2,
    GROUP = 3,
    SQUARE_CHAT = 4
}

struct Chatapp {
    1: string chatappId;
    2: string name;
    3: string icon;
    4: string url;
    5: list<AvailableChatType> availableChatTypes;
}

struct GetChatappResponse {
    1: Chatapp app;
}

struct GetChatappRequest {
    1: string chatappId;
    2: string language;
}

enum ChatCategory {
    PRIORITY = 2,
    REGULAR = 1,
    MORE = 3
}

struct MyChatapp {
    1: Chatapp app;
    2: ChatCategory category;
    3: i64 priority;
}

struct GetMyChatappsResponse {
    1: list<MyChatapp> apps;
    2: string continuationToken;
}

struct GetMyChatappsRequest {
    1: string language;
    2: string continuationToken;
}

enum ChatAppErrorCode {
    INVALID_REQUEST = 1,
    UNAUTHORIZED = 2,
    SERVER_ERROR = 100
}

exception ChatappException {
    1: ChatAppErrorCode code;
    2: string reason;
}

enum MenuStyle {
     LIGHT = 1,
     LIGHT_TRANSLUCENT = 2,
     DARK_TRANSLUCENT = 3
}

struct LiffView {
    1: string type;
    2: string url;
    11: bool trustedDomain;
    6: string titleIconUrl;
    4: i32 titleTextColor;
    7: i32 titleSubtextColor;
    8: i32 titleButtonColor;
    5: i32 titleBackgroundColor;
    9: i32 progressBarColor;
    10: i32 progressBackgroundColor;
    12: bool suspendable;
    16: bool suspendableV2;
    13: bool maxBrightness;
    14: i32 titleButtonAreaBackgroundColor;
    15: i32 titleButtonAreaBorderColor;
    17: MenuStyle menuStyle;
    18: bool moduleMode;
}

enum LiffFeature {
    GEOLOCATION = 1,
    ADVERTISING_ID = 2,
    BLUETOOTH_LE = 3,
    QR_CODE = 4,
    ADVERTISING_SDK = 5,
    ADD_TO_HOME = 6,
    SHARE_TARGET_MESSAGE = 7,
    VIDEO_AUTO_PLAY = 8,
    PROFILE_PLUS = 9
}

struct LiffViewResponse {
    1: LiffView view;
    2: string contextToken;
    3: string accessToken;
    4: string featureToken;
    5: list<LiffFeature> features;
    6: string channelId;
    7: string idToken;
    8: list<string> scopes;
}

struct LiffNoneContext {}

struct LiffChatContext {
    1: string chatMid;
}

struct LiffSquareChatContext {
    1: string squareChatMid;
}

struct LiffContext {
    1: LiffNoneContext none;
    2: LiffChatContext chat;
    3: LiffSquareChatContext squareChat;
}

struct LiffAdvertisingId {
    1: string advertisingId;
    2: bool tracking;
}

struct LiffDeviceSetting {
    1: bool videoAutoPlayAllowed;
    2: LiffAdvertisingId advertisingId;
}

struct LiffViewRequest {
    1: string liffId;
    3: string lang;
    2: LiffContext context;
    4: LiffDeviceSetting deviceSetting;
}

struct RevokeTokenRequest {
    1: string accessToken;
}

enum LiffErrorCode {
    INVALID_REQUEST = 1,
    UNAUTHORIZED = 2,
    CONSENT_REQUIRED = 3,
    VERSION_UPDATE_REQUIRED = 4,
    SERVER_ERROR = 100
}

struct LiffErrorConsentRequired {
    1: string channelId;
    2: string consentUrl;
}

struct LiffErrorPayload {
    3: LiffErrorConsentRequired consentRequired;
}

exception LiffException {
    1: LiffErrorCode code;
    2: string message;
    3: LiffErrorPayload payload;
}

struct MoretabRecommendAccount {
    1: string mid;
    2: string displayName;
    3: string statusMessage;
    4: string pictureStatus;
    5: string picturePath;
}

struct MoretabRecommend {
    1: list<MoretabRecommendAccount> accounts;
    2: i64 nextUpdateTime;
    3: i64 cacheTtlMillis;
}

struct Balance {
    1: string currentPointsFixedPointDecimal;
}

struct GetBalanceResponse {
    1: Balance balance;
}

struct GetBalanceRequest {}

enum PointErrorCode {
    REQUEST_DUPLICATION = 3001,
    INVALID_PARAMETER = 3002,
    NOT_ENOUGH_BALANCE = 3003,
    AUTHENTICATION_FAIL = 3004,
    API_ACCESS_FORBIDDEN = 3005,
    MEMBER_ACCOUNT_NOT_FOUND = 3006,
    SERVICE_ACCOUNT_NOT_FOUND = 3007,
    TRANSACTION_NOT_FOUND = 3008,
    ALREADY_REVERSED_TRANSACTION = 3009,
    MESSAGE_NOT_READABLE = 3010,
    HTTP_REQUEST_METHOD_NOT_SUPPORTED = 3011,
    HTTP_MEDIA_TYPE_NOT_SUPPORTED = 3012,
    NOT_ALLOWED_TO_DEPOSIT = 3013,
    NOT_ALLOWED_TO_PAY = 3014,
    TRANSACTION_ACCESS_FORBIDDEN = 3015,
    INVALID_SERVICE_CONFIGURATION = 4001,
    DCS_COMMUNICATION_FAIL = 4004,
    UPDATE_BALANCE_FAIL = 5007,
    SYSTEM_ERROR = 5999,
    SYSTEM_MAINTENANCE = 5888
}

exception PointException {
    1: PointErrorCode code;
    2: string reason;
    3: map<string, string> extra;
}

struct RegisterPrimaryResponse {
    1: string authToken;
}

struct MigratePrimaryResponse {
    1: string authToken;
}

enum SecondAuthMethod {
    UNKNOWN = 0,
    SKIP = 1,
    WEB_BASED = 2
}

struct GetSecondAuthMethodResponse {
    1: SecondAuthMethod secondAuthMethod;
}

struct WebAuthDetails {
    1: string baseUrl;
    2: string token;
}

struct IssueWebAuthDetailsForSecondAuthResponse {
     1: WebAuthDetails webAuthDetails;
}

struct IssueWebAuthDetailsForAcctVerifResponse {
    1: WebAuthDetails webAuthDetails;
}

enum AccountIdentifierType {
    UNKNOWN = 0,
    PHONE_NUMBER = 1,
    EMAIL = 2
}

struct AccountIdentifier {
    1: AccountIdentifierType type;
    2: string identifier;
    11: string countryCode;
}

struct OpenSessionResponse {
    1: string authSessionId;
}

struct OpenSessionRequest {
    1: map<string, string> metaData;
}

struct UserProfile {
    1: string displayName;
    2: string profileImageUrl;
}

struct VerifyAccountUsingPwdResponse {
    2: UserProfile userProfile;
}

enum EncryptionKeyVersion {
    UNKNOWN = 0,
    V1 = 1
}

struct EncryptedPassword {
    1: EncryptionKeyVersion encryptionKeyVersion;
    2: string cipherText;
}

struct VerifySocialLoginResponse {
    2: bool accountExist;
    11: UserProfile userProfile;
    12: bool sameUdidFromAccount;
}

struct Device {
    1: string udid;
    2: string deviceModel;
}

enum SocialLoginType {
    UNKNOWN = 0,
    FACEBOOK = 1,
    APPLE = 2
}

struct SocialLogin {
    1: SocialLoginType type;
    2: string accessToken;
    3: string countryCode;
}

enum VerifMethod {
    UNKNOWN = 0,
    UNAVAILABLE = 1,
    SMS = 2,
    TTS = 3
}

struct GetPhoneVerifMethodResponse {
    1: list<VerifMethod> availableMethods;
    3: string prettifiedPhoneNumber;
}

struct UserPhoneNumber {
    1: string phoneNumber;
    2: string countryCode;
}

struct SendPinCodeForPhoneResponse {
    1: list<VerifMethod> availableMethods;
}

struct VerifyPhoneResponse {
    2: bool accountExist;
    3: bool sameUdidFromAccount;
    11: UserProfile userProfile;
}

struct SetPasswordResponse {}

struct ExchangeEncryptionKeyResponse {
    1: string publicKey;
    2: string nonce;
}

struct ExchangeEncryptionKeyRequest {
    1: EncryptionKeyVersion authKeyVersion;
    2: string publicKey;
    3: string nonce;
}

struct GetCountryInfoResponse {
    1: string countryCode;
    2: bool countryInEEA;
    3: set<string> countrySetOfEEA;
}

struct SimCard {
    1: string countryCode;
    2: string hni;
    3: string carrierName;
}

struct GetUserProfileResponse {
    1: UserProfile userProfile;
}

enum AvailableMethod {
    UNKNOWN = 0,
    SKIP = 1,
    PASSWORD = 2,
    WEB_BASED = 3
}

struct GetAcctVerifMethodResponse {
    1: AvailableMethod availableMethod;
    2: bool sameAccountFromAuthFactor;
}

struct ValidateProfileResponse {}

enum AuthErrorCode {
    INTERNAL_ERROR = 0,
    ILLEGAL_ARGUMENT = 1,
    VERIFICATION_FAILED = 2,
    NOT_FOUND = 3,
    RETRY_LATER = 4,
    HUMAN_VERIFICATION_REQUIRED = 5,
    INVALID_CONTEXT = 100,
    APP_UPGRADE_REQUIRED = 101
}

exception AuthException {
    1: AuthErrorCode code;
    2: string alertMessage;
    11: WebAuthDetails webAuthDetails;
}

struct CreateQrSessionResponse {
    1: string authSessionId;
}

struct CreateQrSessionRequest {}

struct CreateQrCodeResponse {
    1: string callbackUrl;
}

struct CreateQrCodeRequest {
    1: string authSessionId;
}

struct CreatePinCodeResponse {
    1: string pinCode;
}

struct CreatePinCodeRequest {
    1: string authSessionId;
}

struct QrCodeLoginResponse {
    1: string certificate;
    2: string accessToken;
    3: i64 lastBindTimestamp;
    4: map<string, string> metaData;
}

struct QrCodeLoginRequest {
    1: string authSessionId;
    2: string systemName;
    3: bool autoLoginIsRequired;
}

struct VerifyCertificateRequest {
    1: string authSessionId;
    2: string certificate;
}

struct CheckPinCodeVerifiedRequest {
    1: string authSessionId;
}

struct CheckQrCodeVerifiedRequest {
    1: string authSessionId;
}

struct CancelPinCodeRequest {
    1: string authSessionId;
}

struct GetLoginActorContextResponse {
    1: string appType;
    2: string accessLocation;
}

struct GetLoginActorContextRequest {
    1: string authSessionId;
}

struct VerifyPinCodeRequest {
    1: string authSessionId;
    2: string pinCode;
}

struct VerifyQrCodeRequest {
    1: string authSessionId;
    2: map<string, string> metaData;
}

enum SecondaryQrCodeErrorCode {
    INTERNAL_ERROR = 0,
    ILLEGAL_ARGUMENT = 1,
    VERIFICATION_FAILED = 2,
    NOT_ALLOWED_QR_CODE_LOGIN = 3,
    VERIFICATION_NOTICE_FAILED = 4,
    RETRY_LATER = 5,
    INVALID_CONTEXT = 100,
    APP_UPGRADE_REQUIRED = 101
}

exception SecondaryQrCodeException {
    1: SecondaryQrCodeErrorCode code;
    2: string alertMessage;
}

struct SnsProfile {
    1: string snsUserId;
    2: string snsUserName;
    3: string email;
    4: string thumbnailUrl;
}

enum SnsIdType {
    FACEBOOK = 1,
    SINA = 2,
    RENREN = 3,
    FEIXIN = 4,
    BBM = 5,
    APPLE = 6
}

struct TextMessageAnnouncementContents {
    1: string messageId;
    2: string text;
    3: string senderSquareMemberMid;
    4: i64 createdAt;
}

struct SquareChatAnnouncementContents {
    1: TextMessageAnnouncementContents textMessageAnnouncementContents;
}

enum SquareChatAnnouncementType {
    TEXT_MESSAGE = 0
}

struct SquareChatAnnouncement {
    1: i64 announcementSeq;
    2: SquareChatAnnouncementType type;
    3: SquareChatAnnouncementContents contents;
}

struct CreateSquareChatAnnouncementResponse {
    1: SquareChatAnnouncement announcement;
}

struct CreateSquareChatAnnouncementRequest {
    1: i32 reqSeq;
    2: string squareChatMid;
    3: SquareChatAnnouncement squareChatAnnouncement;
}

struct DeleteSquareChatAnnouncementRequest {
    2: string squareChatMid;
    3: i64 announcementSeq;
}

struct GetSquareChatAnnouncementsResponse {
    1: list<SquareChatAnnouncement> announcements;
}

struct GetSquareChatAnnouncementsRequest {
    2: string squareChatMid;
}

struct MarkAsReadRequest {
    2: string squareChatMid;
    4: string messageId;
}

enum SquareMembershipState {
    JOIN_REQUESTED = 1,
    JOINED = 2,
    REJECTED = 3,
    LEFT = 4,
    KICK_OUT = 5,
    BANNED = 6,
    DELETED = 7
}

enum SquareMemberRole {
    ADMIN = 1,
    CO_ADMIN = 2,
    MEMBER = 10
}

struct SquarePreference {
    1: i64 favoriteTimestamp;
    2: bool notiForNewJoinRequest;
}

struct SquareMember {
    1: string squareMemberMid;
    2: string squareMid;
    3: string displayName;
    4: string profileImageObsHash;
    5: bool ableToReceiveMessage;
    7: SquareMembershipState membershipState;
    8: SquareMemberRole role;
    9: i64 revision;
    10: SquarePreference preference;
    11: string joinMessage;
}

struct SquareStatus {
    1: i32 memberCount;
    2: i32 joinRequestCount;
    3: i64 lastJoinRequestAt;
    4: i32 openChatCount;
}

struct ApproveSquareMembersResponse {
    1: list<SquareMember> approvedMembers;
    2: SquareStatus status;
}

struct ApproveSquareMembersRequest {
    2: string squareMid;
    3: list<string> requestedMemberMids;
}

struct CheckJoinCodeResponse {
    1: string joinToken;
}

struct CheckJoinCodeRequest {
    2: string squareMid;
    3: string joinCode;
}

enum SquareChatType {
    OPEN = 1,
    SECRET = 2,
    ONE_ON_ONE = 3,
    SQUARE_DEFAULT = 4
}

enum SquareChatState {
    ALIVE = 0,
    DELETED = 1,
    SUSPENDED = 2
}

struct SquareChat {
    1: string squareChatMid;
    2: string squareMid;
    3: SquareChatType type;
    4: string name;
    5: string chatImageObsHash;
    6: i64 squareChatRevision;
    7: i32 maxMemberCount;
    8: SquareChatState state;
    9: string invitationUrl;
}

enum MIDType {
    USER = 0,
    ROOM = 1,
    GROUP = 2,
    SQUARE = 3,
    SQUARE_CHAT = 4,
    SQUARE_MEMBER = 5,
    BOT = 6
}

enum PlaceSearchProvider {
    GOOGLE = 0,
    BAIDU = 1,
    FOURSQUARE = 2
}

struct GeolocationAccuracy {
    1: double radiusMeters;
    2: double radiusConfidence;
}

struct Location {
    1: string title;
    2: string address;
    3: double latitude;
    4: double longitude;
    5: string phone;
    6: string categoryId;
    7: PlaceSearchProvider provider;
    8: GeolocationAccuracy accuracy;
}

enum ContentType {
    NONE = 0,
    IMAGE = 1,
    VIDEO = 2,
    AUDIO = 3,
    HTML = 4,
    PDF = 5,
    CALL = 6,
    STICKER = 7,
    PRESENCE = 8,
    GIFT = 9,
    GROUPBOARD = 10,
    APPLINK = 11,
    LINK = 12,
    CONTACT = 13,
    FILE = 14,
    LOCATION = 15,
    POSTNOTIFICATION = 16,
    RICH = 17,
    CHATEVENT = 18,
    MUSIC = 19,
    PAYMENT = 20,
    EXTIMAGE = 21,
    FLEX = 22
}

enum MessageRelationType {
    ORWARD = 0,
    AUTO_REPLY = 1,
    SUBORDINATE = 2,
    REPLY = 3
}

enum ServiceCode {
    UNKNOWN = 0,
    TALK = 1,
    SQUARE = 2
}

struct Message {
    1: string from_;
    2: string to;
    3: MIDType toType;
    4: string id;
    5: i64 createdTime;
    6: i64 deliveredTime;
    10: string text;
    11: optional Location location;
    14: bool hasContent;
    15: ContentType contentType;
    17: binary contentPreview;
    18: map<string, string> contentMetadata;
    19: i8 sessionId;
    20: list<binary> chunks;
    21: string relatedMessageId;
    22: MessageRelationType messageRelationType;
    23: i32 readCount;
    24: ServiceCode relatedMessageServiceCode;
}

enum SquareMessageState {
    SENT = 1,
    DELETED = 2,
    FORBIDDEN = 3
}

struct SquareMessage {
    1: Message message;
    3: MIDType fromType;
    4: i64 squareMessageRevision;
    5: SquareMessageState state;
}

enum NotifiedMessageType {
    MENTION = 1,
    REPLY = 2
}

struct SquareChatStatusWithoutMessage {
    1: i32 memberCount;
    2: i32 unreadMessageCount;
    3: string markedAsReadMessageId;
    4: string mentionedMessageId;
    5: NotifiedMessageType notifiedMessageType;
}

struct SquareChatStatus {
   3: SquareMessage lastMessage;
   4: string senderDisplayName;
   5: SquareChatStatusWithoutMessage otherStatus;
}

enum SquareChatMembershipState {
    JOINED = 1,
    LEFT = 2
}

struct SquareChatMember {
    1: string squareMemberMid;
    2: string squareChatMid;
    3: i64 revision;
    4: SquareChatMembershipState membershipState;
    5: bool notificationForMessage;
}

struct CreateSquareChatResponse {
    1: SquareChat squareChat;
    2: SquareChatStatus squareChatStatus;
    3: SquareChatMember squareChatMember;
}

struct CreateSquareChatRequest {
    1: i32 reqSeq;
    2: SquareChat squareChat;
    3: list<string> squareMemberMids;
}

enum SquareType {
    CLOSED = 0,
    OPEN = 1
}

enum SquareState {
    ALIVE = 0,
    DELETED = 1,
    SUSPENDED = 2
}

enum SquareEmblem {
    SUPER = 1,
    OFFICIAL = 2
}

enum SquareJoinMethodType {
    NONE = 0,
    APPROVAL = 1,
    CODE = 2
}

struct ApprovalValue {
    1: string message;
}

struct CodeValue {
    1: string code;
}

struct SquareJoinMethodValue {
    1: ApprovalValue approvalValue;
    2: CodeValue codeValue;
}

struct SquareJoinMethod {
    1: SquareJoinMethodType type;
    2: SquareJoinMethodValue value;
}

struct Square {
    1: string mid;
    2: string name;
    3: string welcomeMessage;
    4: string profileImageObsHash;
    5: string desc;
    6: bool searchable;
    7: SquareType type;
    8: i32 categoryId;
    9: string invitationURL;
    10: i64 revision;
    11: bool ableToUseInvitationTicket;
    12: SquareState state;
    13: list<SquareEmblem> emblems;
    14: SquareJoinMethod joinMethod;
}

struct SquareAuthority {
    1: string squareMid;
    2: SquareMemberRole updateSquareProfile;
    3: SquareMemberRole inviteNewMember;
    4: SquareMemberRole approveJoinRequest;
    5: SquareMemberRole createPost;
    6: SquareMemberRole createOpenSquareChat;
    7: SquareMemberRole deleteSquareChatOrPost;
    8: SquareMemberRole removeSquareMember;
    9: SquareMemberRole grantRole;
    10: SquareMemberRole enableInvitationTicket;
    11: i64 revision;
}

struct CreateSquareResponse {
    1: Square square;
    2: SquareMember creator;
    3: SquareAuthority authority;
}

struct CreateSquareRequest {
    1: i32 reqSeq;
    2: Square square;
    3: SquareMember creator;
}

struct DeleteSquareChatRequest {
    2: string squareChatMid;
    3: i64 revision;
}

struct DestroyMessagesRequest {
    2: string squareChatMid;
    4: set<string> messageIds;
}

enum SquareFeatureControlState {
    DISABLED = 1,
    ENABLED = 2
}

enum BooleanState {
    NONE = 0,
    OFF = 1,
    ON = 2
}

struct SquareFeature {
    1: SquareFeatureControlState controlState;
    2: BooleanState booleanValue;
}

struct SquareFeatureSet {
    1: string squareMid;
    2: i64 revision;
    11: SquareFeature creatingSecretSquareChat;
    12: SquareFeature invitingIntoOpenSquareChat;
    13: SquareFeature creatingSquareChat;
}

struct NoteStatus {
    1: i32 noteCount;
    2: i64 latestCreatedAt;
}

struct FindSquareByEmidResponse {
    1: Square square;
    2: SquareMember myMembership;
    3: SquareAuthority squareAuthority;
    4: SquareStatus squareStatus;
    5: SquareFeatureSet squareFeatureSet;
    6: NoteStatus noteStatus;
}

struct FindSquareByEmidRequest {
    1: string emid;
}

struct FindSquareByInvitationTicketResponse {
    1: Square square;
    2: SquareMember myMembership;
    3: SquareAuthority squareAuthority;
    4: SquareStatus squareStatus;
    5: SquareFeatureSet squareFeatureSet;
    6: NoteStatus noteStatus;
    7: SquareChat chat;
    8: SquareChatStatus chatStatus;
}

struct FindSquareByInvitationTicketRequest {
    2: string invitationTicket;
}

struct GetInvitationTicketUrlResponse {
    1: string invitationURL;
}

struct GetInvitationTicketUrlRequest {
    2: string mid;
}

struct GetJoinableSquareChatsResponse {
    1: list<SquareChat> squareChats;
    2: string continuationToken;
    3: i32 totalSquareChatCount;
    4: map<string, SquareChatStatus> squareChatStatuses;
}

struct GetJoinableSquareChatsRequest {
    1: string squareMid;
    10: string continuationToken;
    11: i32 limit;
}

struct GetSquareAuthorityResponse {
    1: SquareAuthority authority;
}

struct GetSquareAuthorityRequest {
    1: string squareMid;
}

struct Category {
    1: i32 id;
    2: string name;
}

struct GetSquareCategoriesResponse {
    1: list<Category> categoryList;
}

struct GetSquareCategoriesRequest {}

struct GetSquareChatMemberResponse {
    1: SquareChatMember squareChatMember;
}

struct GetSquareChatMemberRequest {
    2: string squareMemberMid;
    3: string squareChatMid;
}

struct GetSquareChatMembersResponse {
    1: list<SquareMember> squareChatMembers;
    2: string continuationToken;
}

struct GetSquareChatMembersRequest {
    1: string squareChatMid;
    2: string continuationToken;
    3: i32 limit;
}

struct GetSquareFeatureSetResponse {
    1: SquareFeatureSet squareFeatureSet;
}

struct GetSquareFeatureSetRequest {
    2: string squareMid;
}

enum SquareMemberRelationState {
    NONE = 1,
    BLOCKED = 2
}

struct SquareMemberRelation {
    1: SquareMemberRelationState state;
    2: i64 revision;
}

struct GetSquareMemberRelationResponse {
    1: string squareMid;
    2: string targetSquareMemberMid;
    3: SquareMemberRelation relation;
}

struct GetSquareMemberRelationRequest {
    2: string squareMid;
    3: string targetSquareMemberMid;
}

struct GetSquareMemberRelationsResponse {
    1: list<SquareMember> squareMembers;
    2: map<string, SquareMemberRelation> relations;
    3: string continuationToken;
}

struct GetSquareMemberRelationsRequest {
    2: SquareMemberRelationState state;
    3: string continuationToken;
    4: i32 limit;
}

struct GetSquareResponse {
    1: Square square;
    2: SquareMember myMembership;
    3: SquareAuthority squareAuthority;
    4: SquareStatus squareStatus;
    5: SquareFeatureSet squareFeatureSet;
    6: NoteStatus noteStatus;
}

struct GetSquareRequest {
    2: string mid;
}

struct InviteIntoSquareChatResponse {
    1: list<string> inviteeMids;
}

struct InviteIntoSquareChatRequest {
    1: list<string> inviteeMids;
    2: string squareChatMid;
}

struct InviteToSquareRequest {
    2: string squareMid;
    3: list<string> invitees;
    4: string squareChatMid;
}

struct JoinSquareChatResponse {
    1: SquareChat squareChat;
    2: SquareChatStatus squareChatStatus;
    3: SquareChatMember squareChatMember;
}

struct JoinSquareChatRequest {
    1: string squareChatMid;
}

struct JoinSquareResponse {
    1: Square square;
    2: SquareAuthority squareAuthority;
    3: SquareStatus squareStatus;
    4: SquareMember squareMember;
    5: SquareFeatureSet squareFeatureSet;
    6: NoteStatus noteStatus;
    7: SquareChat squareChat;
    8: SquareChatStatus squareChatStatus;
    9: SquareChatMember squareChatMember;
}

struct JoinSquareRequest {
    2: string squareMid;
    3: SquareMember member;
    4: string squareChatMid;
    5: SquareJoinMethodValue joinValue;
}

struct LeaveSquareChatRequest {
    2: string squareChatMid;
    3: bool sayGoodbye;
    4: i64 squareChatMemberRevision;
}

struct LeaveSquareRequest {
    2: string squareMid;
}

struct SubscriptionState {
    1: i64 subscriptionId;
    2: i64 ttlMillis;
}

struct RefreshSubscriptionsResponse {
    1: i64 ttlMillis;
    2: map<i64, SubscriptionState> subscriptionStates;
}

struct RefreshSubscriptionsRequest {
    2: list<i64> subscriptions;
}

struct RejectSquareMembersResponse {
    1: list<SquareMember> rejectedMembers;
    2: SquareStatus status;
}

struct RejectSquareMembersRequest {
    2: string squareMid;
    3: list<string> requestedMemberMids;
}

struct RemoveSubscriptionsRequest {
    2: list<i64> unsubscriptions;
}

enum ReportType {
    ADVERTISING = 1,
    GENDER_HARASSMENT = 2,
    HARASSMENT = 3,
    OTHER = 4,
    IRRELEVANT_CONTENT = 5
}

struct ReportSquareChatRequest {
    2: string squareMid;
    3: string squareChatMid;
    5: ReportType reportType;
    6: string otherReason;
}

struct ReportSquareMemberRequest {
    2: string squareMemberMid;
    3: ReportType reportType;
    4: string otherReason;
    5: string squareChatMid;
}

struct ReportSquareMessageRequest {
    2: string squareMid;
    3: string squareChatMid;
    4: string squareMessageId;
    5: ReportType reportType;
    6: string otherReason;
}

struct ReportSquareRequest {
    2: string squareMid;
    3: ReportType reportType;
    4: string otherReason;
}

struct SearchSquareChatMembersResponse {
    1: list<SquareMember> members;
    2: string continuationToken;
}

struct SquareChatMemberSearchOption {
    1: string displayName;
}

struct SearchSquareChatMembersRequest {
    1: string squareChatMid;
    2: SquareChatMemberSearchOption searchOption;
    3: string continuationToken;
    4: i32 limit;
}

struct SearchSquareMembersResponse {
    1: list<SquareMember> members;
    2: i64 revision;
    3: string continuationToken;
    4: i32 totalCount;
}

struct SquareMemberSearchOption {
    1: SquareMembershipState membershipState;
    2: set<SquareMemberRole> memberRoles;
    3: string displayName;
    4: BooleanState ableToReceiveMessage;
    5: BooleanState ableToReceiveFriendRequest;
    6: string chatMidToExcludeMembers;
    7: bool includingMe;
    8: bool excludeBlockedMembers;
}

struct SearchSquareMembersRequest {
    2: string squareMid;
    3: SquareMemberSearchOption searchOption;
    4: string continuationToken;
    5: i32 limit;
}

struct SendMessageResponse {
    1: SquareMessage createdSquareMessage;
}

struct SendMessageRequest {
    1: i32 reqSeq;
    2: string squareChatMid;
    3: SquareMessage squareMessage;
}

enum SquareAuthorityAttribute {
    UPDATE_SQUARE_PROFILE = 1,
    INVITE_NEW_MEMBER = 2,
    APPROVE_JOIN_REQUEST = 3,
    CREATE_POST = 4,
    CREATE_OPEN_SQUARE_CHAT = 5,
    DELETE_SQUARE_CHAT_OR_POST = 6,
    REMOVE_SQUARE_MEMBER = 7,
    GRANT_ROLE = 8,
    ENABLE_INVITATION_TICKET = 9,
    CREATE_CHAT_ANNOUNCEMENT = 10,
    UPDATE_MAX_CHAT_MEMBER_COUNT = 11
}

struct UpdateSquareAuthorityResponse {
    1: set<SquareAuthorityAttribute> updatdAttributes;
    2: SquareAuthority authority;
}

struct UpdateSquareAuthorityRequest {
    2: set<SquareAuthorityAttribute> updateAttributes;
    3: SquareAuthority authority;
}

struct UpdateSquareChatMemberResponse {
    1: SquareChatMember updatedChatMember;
}

enum SquareChatMemberAttribute {
    MEMBERSHIP_STATE = 4,
    NOTIFICATION_MESSAGE = 6
}

struct UpdateSquareChatMemberRequest {
    2: set<SquareChatMemberAttribute> updatedAttrs;
    3: SquareChatMember chatMember;
}

enum SquareChatAttribute {
    NAME = 2,
    SQUARE_CHAT_IMAGE = 3,
    STATE = 4,
    TYPE = 5,
    MAX_MEMBER_COUNT = 6
}

struct pdateSquareChatResponse {
    1: set<SquareChatAttribute> updatedAttrs;
    2: SquareChat squareChat;
}

struct UpdateSquareChatRequest {
    2: set<SquareChatAttribute> updatedAttrs;
    3: SquareChat squareChat;
}

enum SquareMemberRelationAttribute {
    BLOCKED = 0
}

struct UpdateSquareMemberRelationResponse {
    1: string squareMid;
    2: string targetSquareMemberMid;
    3: set<SquareMemberRelationAttribute> updatedAttrs;
    4: SquareMemberRelation relation;
}

struct UpdateSquareMemberRelationRequest {
    2: string squareMid;
    3: string targetSquareMemberMid;
    4: set<SquareMemberRelationAttribute> updatedAttrs;
    5: SquareMemberRelation relation;
}

enum SquareMemberAttribute {
    DISPLAY_NAME = 1,
    PROFILE_IMAGE = 2,
    ABLE_TO_RECEIVE_MESSAGE = 3,
    MEMBERSHIP_STATE = 5,
    ROLE = 6,
    PREFERENCE = 7
}

struct UpdateSquareMemberResponse {
    1: set<SquareMemberAttribute> updatedAttrs;
    2: SquareMember squareMember;
}

enum SquarePreferenceAttribute {
    FAVORITE = 1,
    NOTI_FOR_NEW_JOIN_REQUEST = 2
}

struct UpdateSquareMemberRequest {
    2: set<SquareMemberAttribute> updatedAttrs;
    3: set<SquarePreferenceAttribute> updatedPreferenceAttrs;
    4: SquareMember squareMember;
}

struct UpdateSquareMembersResponse {
    1: set<SquareMemberAttribute> updatedAttrs;
    2: SquareMember editor;
    3: map<string, SquareMember> members;
}

struct UpdateSquareMembersRequest {
    1: set<SquareMemberAttribute> updatedAttrs;
    3: list<SquareMember> members;
}

enum SquareAttribute {
    NAME = 1,
    WELCOME_MESSAGE = 2,
    PROFILE_IMAGE = 3,
    DESCRIPTION = 4,
    SEARCHABLE = 6,
    CATEGORY = 7,
    INVITATION_URL = 8,
    ABLE_TO_USE_INVITATION_URL = 9,
    STATE = 10,
    EMBLEMS = 11,
    JOIN_METHOD = 12
}

struct UpdateSquareResponse {
    1: set<SquareAttribute> updatedAttrs;
    2: Square square;
}

struct UpdateSquareRequest {
    2: set<SquareAttribute> updatedAttrs;
    3: Square square;
}

enum SquareEventType {
    RECEIVE_MESSAGE = 0,
    SEND_MESSAGE = 1,
    MUTATE_MESSAGE = 41,
    NOTIFIED_JOIN_SQUARE_CHAT = 2,
    NOTIFIED_INVITE_INTO_SQUARE_CHAT = 3,
    NOTIFIED_LEAVE_SQUARE_CHAT = 4,
    NOTIFIED_DESTROY_MESSAGE = 5,
    NOTIFIED_MARK_AS_READ = 6,
    NOTIFIED_UPDATE_SQUARE_MEMBER_PROFILE = 7,
    NOTIFIED_KICKOUT_FROM_SQUARE = 19,
    NOTIFIED_SHUTDOWN_SQUARE = 18,
    NOTIFIED_DELETE_SQUARE_CHAT = 20,
    NOTIFIED_UPDATE_SQUARE_CHAT_PROFILE_NAME = 30,
    NOTIFIED_UPDATE_SQUARE_CHAT_PROFILE_IMAGE = 31,
    NOTIFIED_UPDATE_SQUARE_CHAT_MAX_MEMBER_COUNT = 38,
    NOTIFIED_UPDATE_SQUARE_CHAT_ANNOUNCEMENT = 37,
    NOTIFIED_ADD_BOT = 33,
    NOTIFIED_REMOVE_BOT = 34,
    NOTIFIED_UPDATE_SQUARE = 8,
    NOTIFIED_UPDATE_SQUARE_STATUS = 9,
    NOTIFIED_UPDATE_SQUARE_AUTHORITY = 10,
    NOTIFIED_UPDATE_SQUARE_MEMBER = 11,
    NOTIFIED_UPDATE_SQUARE_CHAT = 12,
    NOTIFIED_UPDATE_SQUARE_CHAT_STATUS = 13,
    NOTIFIED_UPDATE_SQUARE_CHAT_MEMBER = 14,
    NOTIFIED_CREATE_SQUARE_MEMBER = 15,
    NOTIFIED_CREATE_SQUARE_CHAT_MEMBER = 16,
    NOTIFIED_UPDATE_SQUARE_MEMBER_RELATION = 17,
    NOTIFIED_UPDATE_SQUARE_FEATURE_SET = 32,
    NOTIFIED_UPDATE_SQUARE_NOTE_STATUS = 36,
    NOTIFICATION_JOIN_REQUEST = 21,
    NOTIFICATION_JOINED = 22,
    NOTIFICATION_PROMOTED_COADMIN = 23,
    NOTIFICATION_PROMOTED_ADMIN = 24,
    NOTIFICATION_DEMOTED_MEMBER = 25,
    NOTIFICATION_KICKED_OUT = 26,
    NOTIFICATION_SQUARE_DELETE = 27,
    NOTIFICATION_SQUARE_CHAT_DELETE = 28,
    NOTIFICATION_MESSAGE = 29,
    NOTIFICATION_POST_ANNOUNCEMENT = 39,
    NOTIFICATION_POST = 40
}

struct SquareEventReceiveMessage {
    1: string squareChatMid;
    2: SquareMessage squareMessage;
}

struct SquareEventSendMessage {
    1: string squareChatMid;
    2: SquareMessage squareMessage;
    3: i32 reqSeq;
}

struct SquareEventMutateMessage {
    1: string squareChatMid;
    2: SquareMessage squareMessage;
    3: i32 reqSeq;
}

struct SquareEventNotifiedJoinSquareChat {
    1: string squareChatMid;
    2: SquareMember joinedMember;
}

struct SquareEventNotifiedInviteIntoSquareChat {
    1: string squareChatMid;
    2: list<SquareMember> invitees;
    3: SquareMember invitor;
    4: SquareMemberRelation invitorRelation;
}

struct SquareEventNotifiedLeaveSquareChat {
    1: string squareChatMid;
    2: string squareMemberMid;
    3: bool sayGoodbye;
    4: SquareMember squareMember;
}

struct SquareEventNotifiedDestroyMessage {
    1: string squareChatMid;
    3: string messageId;
}

struct SquareEventNotifiedMarkAsRead {
    1: string squareChatMid;
    2: string sMemberMid;
    4: string messageId;
}

struct SquareEventNotifiedUpdateSquareMemberProfile {
    1: string squareChatMid;
    2: SquareMember squareMember;
}

struct SquareEventNotifiedKickoutFromSquare {
    1: string squareChatMid;
    2: list<SquareMember> kickees;
}

struct SquareEventNotifiedShutdownSquare {
    1: string squareChatMid;
    2: Square square;
}

struct SquareEventNotifiedDeleteSquareChat {
    1: SquareChat squareChat;
}

struct SquareEventNotifiedUpdateSquareChatProfileName {
    1: string squareChatMid;
    2: SquareMember editor;
    3: string updatedChatName;
}

struct SquareEventNotifiedUpdateSquareChatProfileImage {
    1: string squareChatMid;
    2: SquareMember editor;
}

struct SquareEventNotifiedUpdateSquareChatMaxMemberCount {
    1: string squareChatMid;
    2: i32 maxMemberCount;
    3: SquareMember editor;
}

struct SquareEventNotifiedAddBot {
    1: string squareChatMid;
    2: SquareMember squareMember;
    3: string botMid;
    4: string botDisplayName;
}

struct SquareEventNotifiedRemoveBot {
     1: string squareChatMid;
     2: SquareMember squareMember;
     3: string botMid;
     4: string botDisplayName;
}

struct SquareEventNotifiedUpdateSquare {
    1: string squareMid;
    2: Square square;
}

struct SquareEventNotifiedUpdateSquareStatus {
    1: string squareMid;
    2: SquareStatus squareStatus;
}

struct SquareEventNotifiedUpdateSquareMember {
    1: string squareMid;
    2: string squareMemberMid;
    3: SquareMember squareMember;
}

struct SquareEventNotifiedUpdateSquareChat {
    1: string squareMid;
    2: string squareChatMid;
    3: SquareChat squareChat;
}

struct SquareEventNotifiedUpdateSquareChatStatus {
    1: string squareChatMid;
    2: SquareChatStatusWithoutMessage statusWithoutMessage;
}

struct SquareEventNotifiedUpdateSquareChatMember {
    1: string squareChatMid;
    3: SquareChatMember squareChatMember;
}

struct SquareEventNotifiedUpdateSquareAuthority {
    1: string squareMid;
    2: SquareAuthority squareAuthority;
}

struct SquareEventNotifiedCreateSquareMember {
    1: Square square;
    2: SquareAuthority squareAuthority;
    3: SquareStatus squareStatus;
    4: SquareMember squareMember;
    5: SquareFeatureSet squareFeatureSet;
    6: NoteStatus noteStatus;
}

struct SquareEventNotifiedCreateSquareChatMember {
    1: SquareChat chat;
    2: SquareChatStatus chatStatus;
    3: SquareChatMember chatMember;
    4: i64 joinedAt;
    5: SquareMember peerSquareMember;
}

struct SquareEventNotifiedUpdateSquareMemberRelation {
    1: string squareMid;
    2: string myMemberMid;
    3: string targetSquareMemberMid;
    4: SquareMemberRelation squareMemberRelation;
}

struct SquareEventNotifiedUpdateSquareFeatureSet {
    1: SquareFeatureSet squareFeatureSet;
}

struct SquareEventNotifiedUpdateSquareNoteStatus {
    1: string squareMid;
    2: NoteStatus noteStatus;
}

struct SquareEventNotifiedUpdateSquareChatAnnouncement {
    1: string squareChatMid;
    2: i64 announcementSeq;
}

struct SquareEventNotificationJoinRequest {
    1: string squareMid;
    2: string squareName;
    3: string requestMemberName;
    4: string profileImageObsHash;
}

struct SquareEventNotificationMemberUpdate {
    1: string squareMid;
    2: string squareName;
    3: string profileImageObsHash;
}

struct SquareEventNotificationSquareDelete {
    1: string squareMid;
    2: string squareName;
    3: string profileImageObsHash;
}

struct SquareEventNotificationSquareChatDelete {
    1: string squareChatMid;
    2: string squareChatName;
    3: string profileImageObsHash;
}

struct SquareEventNotificationMessage {
    1: string squareChatMid;
    2: SquareMessage squareMessage;
    8: i32 reqSeq;
    3: string senderDisplayName;
    4: i32 unreadCount;
    5: bool requiredToFetchChatEvents;
    6: string mentionedMessageId;
    7: NotifiedMessageType notifiedMessageType;
}

struct SquareEventNotificationPostAnnouncement {
    1: string squareMid;
    2: string squareName;
    3: string squareProfileImageObsHash;
    4: string actionUri;
}

enum NotificationPostType {
    POST_MENTION = 2,
    POST_LIKE = 3,
    POST_COMMENT = 4,
    POST_COMMENT_MENTION = 5,
    POST_COMMENT_LIKE = 6,
    POST_RELAY_JOIN = 7
}

struct SquareEventNotificationPost {
    1: string squareMid;
    2: NotificationPostType notificationPostType;
}

struct SquareEventPayload {
    1: SquareEventReceiveMessage receiveMessage;
    2: SquareEventSendMessage sendMessage;
    41: SquareEventMutateMessage mutateMessage;
    3: SquareEventNotifiedJoinSquareChat notifiedJoinSquareChat;
    4: SquareEventNotifiedInviteIntoSquareChat notifiedInviteIntoSquareChat;
    5: SquareEventNotifiedLeaveSquareChat notifiedLeaveSquareChat;
    6: SquareEventNotifiedDestroyMessage notifiedDestroyMessage;
    7: SquareEventNotifiedMarkAsRead notifiedMarkAsRead;
    8: SquareEventNotifiedUpdateSquareMemberProfile notifiedUpdateSquareMemberProfile;
    20: SquareEventNotifiedKickoutFromSquare notifiedKickoutFromSquare;
    19: SquareEventNotifiedShutdownSquare notifiedShutdownSquare;
    21: SquareEventNotifiedDeleteSquareChat notifiedDeleteSquareChat;
    31: SquareEventNotifiedUpdateSquareChatProfileName notifiedUpdateSquareChatProfileName;
    32: SquareEventNotifiedUpdateSquareChatProfileImage notifiedUpdateSquareChatProfileImage;
    38: SquareEventNotifiedUpdateSquareChatMaxMemberCount notifiedUpdateSquareChatMaxMemberCount;
    34: SquareEventNotifiedAddBot notifiedAddBot;
    35: SquareEventNotifiedRemoveBot notifiedRemoveBot;
    9: SquareEventNotifiedUpdateSquare notifiedUpdateSquare;
    14: SquareEventNotifiedUpdateSquareStatus notifiedUpdateSquareStatus;
    10: SquareEventNotifiedUpdateSquareMember notifiedUpdateSquareMember;
    11: SquareEventNotifiedUpdateSquareChat notifiedUpdateSquareChat;
    15: SquareEventNotifiedUpdateSquareChatStatus notifiedUpdateSquareChatStatus;
    12: SquareEventNotifiedUpdateSquareChatMember notifiedUpdateSquareChatMember;
    13: SquareEventNotifiedUpdateSquareAuthority notifiedUpdateSquareAuthority;
    16: SquareEventNotifiedCreateSquareMember notifiedCreateSquareMember;
    17: SquareEventNotifiedCreateSquareChatMember notifiedCreateSquareChatMember;
    18: SquareEventNotifiedUpdateSquareMemberRelation notifiedUpdateSquareMemberRelation;
    33: SquareEventNotifiedUpdateSquareFeatureSet notifiedUpdateSquareFeatureSet;
    36: SquareEventNotifiedUpdateSquareNoteStatus notifiedUpdateSquareNoteStatus;
    37: SquareEventNotifiedUpdateSquareChatAnnouncement notifiedUpdateSquareChatAnnouncement;
    22: SquareEventNotificationJoinRequest notificationJoinRequest;
    23: SquareEventNotificationMemberUpdate notificationJoined;
    24: SquareEventNotificationMemberUpdate notificationPromoteCoadmin;
    25: SquareEventNotificationMemberUpdate notificationPromoteAdmin;
    26: SquareEventNotificationMemberUpdate notificationDemoteMember;
    27: SquareEventNotificationMemberUpdate notificationKickedOut;
    28: SquareEventNotificationSquareDelete notificationSquareDelete;
    29: SquareEventNotificationSquareChatDelete notificationSquareChatDelete;
    30: SquareEventNotificationMessage notificationMessage;
    39: SquareEventNotificationPostAnnouncement notificationPostAnnouncement;
    40: SquareEventNotificationPost notificationPost;
}

enum SquareEventStatus {
    NORMAL = 1,
    ALERT_DISABLED = 2
}

struct SquareEvent {
    2: i64 createdTime;
    3: SquareEventType type;
    4: SquareEventPayload payload;
    5: string syncToken;
    6: SquareEventStatus eventStatus;
}

struct FetchMyEventsResponse {
    1: SubscriptionState subscription;
    2: list<SquareEvent> events;
    3: string syncToken;
    4: string continuationToken;
}

struct FetchMyEventsRequest {
    1: i64 subscriptionId;
    2: string syncToken;
    3: i32 limit;
    4: string continuationToken;
}

struct GetSquareMemberResponse {
    1: SquareMember squareMember;
    2: SquareMemberRelation relation;
    3: string oneOnOneChatMid;
}

struct GetSquareMemberRequest {
    2: string squareMemberMid;
}

struct FetchSquareChatEventsResponse {
    1: SubscriptionState subscription;
    2: list<SquareEvent> events;
    3: string syncToken;
    4: string continuationToken;
}

enum FetchDirection {
    FORWARD = 1,
    BACKWARD = 2
}

struct FetchSquareChatEventsRequest {
    1: i64 subscriptionId;
    2: string squareChatMid;
    3: string syncToken;
    4: i32 limit;
    5: FetchDirection direction;
    6: BooleanState inclusive;
}

enum PreconditionFailedExtraInfo {
    DUPLICATED_DISPLAY_NAME = 0
}

struct UserRestrictionExtraInfo {
    1: string linkUrl;
}

struct ErrorExtraInfo {
    1: PreconditionFailedExtraInfo preconditionFailedExtraInfo;
    2: UserRestrictionExtraInfo userRestrictionInfo;
}

enum SquareErrorCode {
    UNKNOWN = 0,
    INTERNAL_ERROR = 500,
    NOT_IMPLEMENTED = 501,
    TRY_AGAIN_LATER = 503,
    MAINTENANCE = 505,
    NO_PRESENCE_EXISTS = 506,
    ILLEGAL_ARGUMENT = 400,
    AUTHENTICATION_FAILURE = 401,
    FORBIDDEN = 403,
    NOT_FOUND = 404,
    REVISION_MISMATCH = 409,
    PRECONDITION_FAILED = 410
}


exception SquareException {
    1: SquareErrorCode errorCode;
    2: ErrorExtraInfo errorExtraInfo;
    3: string reason;
}

service AuthService {
    string openAuthSession(
        2: AuthSessionRequest request) throws (1: TalkException e);

    string verifyQrcodeWithE2EE(
        2: string verifier,
        3: string pinCode,
        4: ErrorCode errorCode,
        5: E2EEPublicKey publicKey,
        6: binary encryptedKeyChain,
        7: binary hashKeyChain) throws (1: TalkException e);

    void respondE2EELoginRequest(
        1: string verifier,
        2: E2EEPublicKey publicKey,
        3: binary encryptedKeyChain,
        4: binary hashKeyChain,
        5: ErrorCode errorCode) throws (1: TalkException e);

    SecurityCenterResult issueTokenForAccountMigrationSettings(
        2: bool enforce) throws (1: TalkException e);

    SecurityCenterResult issueTokenForAccountMigration(
        2: string migrationSessionId) throws (1: TalkException e);

    IdentityCredentialResponse setPassword(
        2: string authSessionId,
        3: IdentityCredentialRequest request) throws (1: TalkException e);

    IdentityCredentialResponse setIdentifierAndPassword(
        2: string authSessionId,
        3: IdentityCredentialRequest request) throws (1: TalkException e);

    IdentityCredentialResponse updateIdentifier(
        2: string authSessionId,
        3: IdentityCredentialRequest request) throws (1: TalkException e);

    IdentityCredentialResponse updatePassword(
        2: string authSessionId,
        3: IdentityCredentialRequest request) throws (1: TalkException e);

    IdentityCredentialResponse removeIdentifier(
        2: string authSessionId,
        3: IdentityCredentialRequest request) throws (1: TalkException e);

    IdentityCredentialResponse setIdentifier(
        2: string authSessionId,
        3: IdentityCredentialRequest request) throws (1: TalkException e);

    IdentityCredentialResponse resendIdentifierConfirmation(
        2: string authSessionId,
        3: IdentityCredentialRequest request) throws (1: TalkException e);

    IdentityCredentialResponse confirmIdentifier(
        2: string authSessionId,
        3: IdentityCredentialRequest request) throws (1: TalkException e);

    RSAKey getAuthRSAKey(
        2: string authSessionId,
        3: IdentityProvider identityProvider) throws (1: TalkException e);

    AuthKeyExchangeResponse exchangeKey(
        2: string authSessionId,
        3: AuthKeyExchangeRequest request) throws (1: TalkException e);

    AuthLoginResponse setClovaCredential(
        2: string authSessionId,
        3: AuthLoginRequest request) throws (1: TalkException e);

    string confirmE2EELogin(
        1: string verifier,
        2: binary deviceSecret) throws (1: TalkException e);

    LoginResult loginZ(
        2: LoginRequest loginRequest) throws (1: TalkException e);

    void logoutZ() throws (1: TalkException e);
}

service CallService {
    GroupCallRoute acquireGroupCallRoute(
        2: string chatMid,
        3: GroupCallMediaType mediaType,
        4: bool isInitialHost,
        5: list<string> capabilities) throws (1: TalkException e);

    CallRoute acquireCallRoute(
        2: string to,
        3: FreeCallType callType,
        4: map<string, string> fromEnvInfo) throws (1: TalkException e);

    PaidCallDialing markPaidCallAd(
        2: string dialedNumber,
        3: string language,
        4: bool disableCallerId) throws (1: TalkException e);

    PaidCallRedeemResult redeemPaidCallVoucher(
        2: string serial,
        3: string language)

    PaidCallResponse lookupPaidCall(
        2: string dialedNumber,
        3: string language,
        4: string referer) throws (1: TalkException e);

    TestCallRoute acquireTestCallRoute() throws (1: TalkException e);

    PaymentReservationResult reserveCallCreditPurchase(
        2: CoinPurchaseReservation request) throws (1: TalkException e);

    GroupCall getGroupCall(
        2: string chatMid) throws (1: TalkException e);

    list<CoinProductItem> getCallCreditProducts(
        2: PaymentType appStoreCode,
        3: PaymentPgType pgCode,
        4: string country,
        5: string language) throws (1: TalkException e);

    PaidCallHistoryResult getPaidCallHistory(
        2: i64 start,
        3: i32 size,
        4: string language) throws (1: TalkException e);

    PaidCallResponse acquirePaidCallRoute(
        2: PaidCallType paidCallType,
        3: string dialedNumber,
        4: string language,
        5: string networkCode,
        6: bool disableCallerId,
        7: string referer,
        8: string adSessionId) throws (1: TalkException e);

    void inviteIntoGroupCall(
        2: string chatMid,
        3: list<string> memberMids,
        4: GroupCallMediaType mediaType) throws (1: TalkException e);

    PaidCallAdResult getPaidCallAdStatus() throws (1: TalkException e);

    list<PaidCallUserRate> searchPaidCallUserRate(
        2: string countryCode,
        3: string language) throws (1: TalkException e);

    CoinHistoryResult getCallCreditPurchaseHistory(
        2: CoinHistoryCondition request) throws (1: TalkException e);

    PaidCallMetadataResult getPaidCallMetadata(
        2: string language) throws (1: TalkException e);

    list<PaidCallBalance> getPaidCallBalanceList(
        2: string language) throws (1: TalkException e);
}

service ChannelService {
    ChannelToken approveChannelAndIssueChannelToken(
        1: string channelId) throws (1: ChannelException e);

    WebLoginResponse getReturnUrlWithRequestTokenForAutoLogin(
        2: WebLoginRequest webLoginRequest) throws (1: ChannelException e);

    ChannelInfo getChannelInfo(
        2: string channelId,
        3: string locale) throws (1: ChannelException e);

    RequestTokenResponse issueRequestTokenWithAuthScheme(
        1: string channelId,
        2: string otpId,
        3: list<string> authScheme,
        4: string returnUrl) throws (1: ChannelException e);

    ApprovedChannelInfos getApprovedChannels(
        2: i64 lastSynced,
        3: string locale) throws (1: ChannelException e);

    string reserveCoinUse(
        2: CoinUseReservation request,
        3: string locale) throws (1: ChannelException e);

    ChannelDomains getCommonDomains(
        1: i64 lastSynced) throws (1: ChannelException e);

    list<string> getUpdatedChannelIds(
        1: list<ChannelIdWithLastUpdated> channelIds) throws (1: ChannelException e);

    ChannelToken issueChannelToken(
        1: string channelId) throws (1: ChannelException e);

    WebLoginResponse getWebLoginDisallowedUrl(
        2: WebLoginRequest webLoginRequest) throws (1: ChannelException e);

    list<ChannelNotificationSetting> getChannelNotificationSettings(
        1: string locale) throws (1: ChannelException e);

    void updateChannelNotificationSetting(
        1: list<ChannelNotificationSetting> setting) throws (1: ChannelException e);

    void revokeChannel(
        1: string channelId) throws (1: ChannelException e);

    ChannelSettings getChannelSettings() throws (1: ChannelException e);

    bool updateChannelSettings(
        1: ChannelSettings channelSettings) throws (1: ChannelException e);
}

service ChatAppService {
    GetChatappResponse getChatapp(
        1: GetChatappRequest request) throws (1: ChatappException e);

    GetMyChatappsResponse getMyChatapps(
        1: GetMyChatappsRequest request) throws (1: ChatappException e);
}

service LiffService {
    LiffViewResponse issueLiffView(
        1: LiffViewRequest request) throws (1: LiffException e);

    void revokeToken(
        1: RevokeTokenRequest request) throws (1: LiffException e);
}

service PersonaService {
    MoretabRecommend getMoretabRecommend() throws (1: TalkException e);
}

service PointService {
    GetBalanceResponse getBalance(
        1: GetBalanceRequest request) throws (1: PointException e);
}

service PrimaryAccountInitService {
    RegisterPrimaryResponse registerPrimaryUsingPhone(
        2: string authSessionId) throws (1: AuthException e);

    RegisterPrimaryResponse registerPrimaryUsingSocialLogin(
        2: string authSessionId) throws (1: AuthException e);

    MigratePrimaryResponse migratePrimaryUsingSocialLogin(
        1: string authSessionId) throws (1: AuthException e);

    MigratePrimaryResponse migratePrimaryUsingPhone(
        1: string authSessionId) throws (1: AuthException e);

    GetSecondAuthMethodResponse getSecondAuthMethod(
        1: string authSessionId) throws (1: AuthException e);

    IssueWebAuthDetailsForSecondAuthResponse issueWebAuthDetailsForSecondAuth(
        1: string authSessionId) throws (1: AuthException e);

    IssueWebAuthDetailsForAcctVerifResponse issueWebAuthDetailsForAcctVerif(
        1: string authSessionId,
        2: AccountIdentifier accountIdentifier) throws (1: AuthException e);

    string openSession(
        1: OpenSessionRequest request) throws (1: AuthException e);

    VerifyAccountUsingPwdResponse verifyAccountUsingPwd(
        1: string authSessionId,
        2: AccountIdentifier accountIdentifier,
        3: EncryptedPassword encryptedPassword) throws (1: AuthException e);

    VerifySocialLoginResponse verifySocialLogin(
        1: string authSessionId,
        2: Device device,
        3: SocialLogin socialLogin) throws (1: AuthException e);

    GetPhoneVerifMethodResponse getPhoneVerifMethod(
        1: string authSessionId,
        2: Device device,
        3: UserPhoneNumber userPhoneNumber) throws (1: AuthException e);

    SendPinCodeForPhoneResponse sendPinCodeForPhone(
        1: string authSessionId,
        2: Device device,
        3: UserPhoneNumber userPhoneNumber,
        4: VerifMethod verifMethod) throws (1: AuthException e);

    VerifyPhoneResponse verifyPhone(
        1: string authSessionId,
        2: Device device,
        3: UserPhoneNumber userPhoneNumber,
        4: string pinCode) throws (1: AuthException e);

    void setPassword(
        1: string authSessionId,
        2: EncryptedPassword encryptedPassword) throws (1: AuthException e);

    ExchangeEncryptionKeyResponse exchangeEncryptionKey(
        1: string authSessionId,
        2: ExchangeEncryptionKeyRequest request) throws (1: AuthException e);

    GetCountryInfoResponse getCountryInfo(
        1: string authSessionId,
        2: SimCard simCard) throws (1: AuthException e);

    GetUserProfileResponse getUserProfile(
        1: string authSessionId,
        2: AccountIdentifier accountIdentifier) throws (1: AuthException e);

    GetAcctVerifMethodResponse getAcctVerifMethod(
        1: string authSessionId,
        2: AccountIdentifier accountIdentifier) throws (1: AuthException e);

    void validateProfile(
        1: string authSessionId,
        2: string displayName) throws (1: AuthException e);
}

service SecondaryQrcodeLoginService {
    CreateQrSessionResponse createSession(
        1: CreateQrSessionRequest request) throws (1: SecondaryQrCodeException e);

    CreateQrCodeResponse createQrCode(
        1: CreateQrCodeRequest request) throws (1: SecondaryQrCodeException e);

    CreatePinCodeResponse createPinCode(
        1: CreatePinCodeRequest request) throws (1: SecondaryQrCodeException e);

    QrCodeLoginResponse qrCodeLogin(
        1:  QrCodeLoginRequest request) throws (1: SecondaryQrCodeException e);

    void verifyCertificate(
        1: VerifyCertificateRequest request) throws (1: SecondaryQrCodeException e);
}

service SecondaryQrCodeLoginPermitNoticeService {
    void checkPinCodeVerified(
        1: CheckPinCodeVerifiedRequest request) throws (1: SecondaryQrCodeException e);

    void checkQrCodeVerified(
        1: CheckQrCodeVerifiedRequest request) throws (1: SecondaryQrCodeException e);
}

service SecondaryQrCodeLoginPermitService {
    void cancelPinCode(
        1: CancelPinCodeRequest request) throws (1: SecondaryQrCodeException e);

    GetLoginActorContextResponse getLoginActorContext(
        1: GetLoginActorContextRequest request) throws (1: SecondaryQrCodeException e);

    void verifyPinCode(
        1: VerifyPinCodeRequest request) throws (1: SecondaryQrCodeException e);

    void verifyQrCode(
        1: VerifyQrCodeRequest request) throws (1: SecondaryQrCodeException e);
}

service SnsAdaptorService {
    SnsProfile getSnsMyProfile(
        2: SnsIdType snsIdType,
        3: string snsAccessToken) throws (1: TalkException e);
}

service SquareService {
    CreateSquareChatAnnouncementResponse  createSquareChatAnnouncement(
       1: CreateSquareChatAnnouncementRequest request) throws (1: SquareException e);

   void deleteSquareChatAnnouncement(
       1: DeleteSquareChatAnnouncementRequest request) throws (1: SquareException e);

   GetSquareChatAnnouncementsResponse getSquareChatAnnouncements(
       1: GetSquareChatAnnouncementsRequest request) throws (1: SquareException e);

   void markAsRead(
       1: MarkAsReadRequest request) throws (1: SquareException e);

   ApproveSquareMembersResponse approveSquareMembers(
       1: ApproveSquareMembersRequest request) throws (1: SquareException e);

   CheckJoinCodeResponse checkJoinCode(
       1: CheckJoinCodeRequest request) throws (1: SquareException e);

   CreateSquareChatResponse createSquareChat(
       1: CreateSquareChatRequest request) throws (1: SquareException e);

   CreateSquareResponse createSquare(
       1: CreateSquareRequest request) throws (1: SquareException e);

   void deleteSquareChat(
       1: DeleteSquareChatRequest request) throws (1: SquareException e);

   void destroyMessages(
       1: DestroyMessagesRequest request) throws (1: SquareException e);

   FindSquareByEmidResponse findSquareByEmid(
       1: FindSquareByEmidRequest request) throws (1: SquareException e);

   FindSquareByInvitationTicketResponse findSquareByInvitationTicketRx(
       1: FindSquareByInvitationTicketRequest request) throws (1: SquareException e);

   GetInvitationTicketUrlResponse getInvitationTicketUrl(
       1: GetInvitationTicketUrlRequest request) throws (1: SquareException e);

   GetJoinableSquareChatsResponse getJoinableSquareChats(
       1: GetJoinableSquareChatsRequest request) throws (1: SquareException e);

   GetSquareAuthorityResponse getSquareAuthority(
       1: GetSquareAuthorityRequest request) throws (1: SquareException e);

   GetSquareCategoriesResponse getCategories(
       1: GetSquareCategoriesRequest request) throws (1: SquareException e);

   GetSquareChatMemberResponse getSquareChatMember(
       1: GetSquareChatMemberRequest request) throws (1: SquareException e);

   GetSquareChatMembersResponse getSquareChatMembers(
       1: GetSquareChatMembersRequest request) throws (1: SquareException e);

   GetSquareFeatureSetResponse getSquareFeatureSet(
       1: GetSquareFeatureSetRequest request) throws (1: SquareException e);

   GetSquareMemberRelationResponse getSquareMemberRelation(
       1: GetSquareMemberRelationRequest request) throws (1: SquareException e);

   GetSquareMemberRelationsResponse getSquareMemberRelations(
       1: GetSquareMemberRelationsRequest request) throws (1: SquareException e);

   GetSquareResponse getSquare(
       1: GetSquareRequest request) throws (1: SquareException e);

   InviteIntoSquareChatResponse inviteIntoSquareChat(
       1: InviteIntoSquareChatRequest request) throws (1: SquareException e);

   void inviteToSquare(
       1: InviteToSquareRequest request) throws (1: SquareException e);

   JoinSquareChatResponse joinSquareChat(
       1: JoinSquareChatRequest request) throws (1: SquareException e);

   JoinSquareResponse joinSquare(
       1: JoinSquareRequest request) throws (1: SquareException e);

   void leaveSquareChat(
       1: LeaveSquareChatRequest request) throws (1: SquareException e);

   void leaveSquare(
       1: LeaveSquareRequest request) throws (1: SquareException e);

   RefreshSubscriptionsResponse refreshSubscriptions(
       1: RefreshSubscriptionsRequest request) throws (1: SquareException e);

   RejectSquareMembersResponse rejectSquareMembers(
       1: RejectSquareMembersRequest request) throws (1: SquareException e);

   void removeSubscriptions(
       1: RemoveSubscriptionsRequest request) throws (1: SquareException e);

   void reportSquareChat(
       1: ReportSquareChatRequest request) throws (1: SquareException e);

   void reportSquareMember(
       1: ReportSquareMemberRequest request) throws (1: SquareException e);

   void reportSquareMessage(
       1: ReportSquareMessageRequest request) throws (1: SquareException e);

   void reportSquare(
       1: ReportSquareRequest request) throws (1: SquareException e);

   SearchSquareChatMembersResponse searchSquareChatMembers(
       1: SearchSquareChatMembersRequest request) throws (1: SquareException e);

   SearchSquareMembersResponse searchSquareMembers(
       1: SearchSquareMembersRequest request) throws (1: SquareException e);

   SendMessageResponse sendMessage(
       1: SendMessageRequest request) throws (1: SquareException e);

   UpdateSquareAuthorityResponse updateSquareAuthority(
       1: UpdateSquareAuthorityRequest request) throws (1: SquareException e);

   UpdateSquareChatMemberResponse updateSquareChatMember(
       1: UpdateSquareChatMemberRequest request) throws (1: SquareException e);

   pdateSquareChatResponse updateSquareChat(
       1: UpdateSquareChatRequest request) throws (1: SquareException e);

   UpdateSquareMemberRelationResponse updateSquareMemberRelation(
       1: UpdateSquareMemberRelationRequest request) throws (1: SquareException e);

   UpdateSquareMemberResponse updateSquareMember(
       1: UpdateSquareMemberRequest request) throws (1: SquareException e);

   UpdateSquareMembersResponse updateSquareMembers(
       1: UpdateSquareMembersRequest request) throws (1: SquareException e);

   UpdateSquareResponse updateSquare(
       1: UpdateSquareRequest request) throws (1: SquareException e);

   FetchMyEventsResponse fetchMyEvents(
       1: FetchMyEventsRequest request) throws (1: SquareException e);

   GetSquareMemberResponse getSquareMember(
       1: GetSquareMemberRequest request) throws (1: SquareException e);

   FetchSquareChatEventsResponse fetchSquareChatEvents(
       1: FetchSquareChatEventsRequest request) throws (1: SquareException e);
}