/*
 * Copyright 2019-2020 Shi0n All rights reserved.
 * Author: Shi0n @UI0x01
 * Last updated: 28 April, 2020
 */

enum CurrencyPropertyPosition {
    PREFIX = 0,
    SUFFIX = 1
}

struct CurrencyProperty {
    1: string code;
    2: string symbol;
    3: CurrencyPropertyPosition position;
    4: i32 scale;
}

enum PayMemberStatus {
    ALIVE = 1,
    SUSPENDED = 2,
    UNREGISTERED = 3
}

enum PayMemberGrade {
    LV1 = 0,
    LV2 = 1,
    LV3 = 2,
    LV9 = 3
}

struct IpassTokenProperty {
    1: string token;
    2: string tokenIssuedTimestamp;
}

struct LinePayInfo {
    1: string balanceAmount;
    2: CurrencyProperty currencyProperty;
    3: PayMemberStatus payMemberStatus;
    4: string applicationUrl;
    5: string chargeUrl;
    6: PayMemberGrade payMemberGrade;
    7: string country;
    8: string referenceNumber;
    9: IpassTokenProperty ipassTokenProperty;
}

struct LinePointInfo {
    1: string balanceAmount;
    2: string applicationUrl;
}

struct LineCoinInfo {
    1: string balanceAmount;
    2: string historyUrl;
}

struct GetBalanceSummaryResponse {
    1: LinePayInfo payInfo;
    2: LinePointInfo pointInfo;
    3: LineCoinInfo coinInfo;
}

struct GetBalanceSummaryRequest {}

struct LinePayPromotion {
    1: string mainText;
    2: string subText;
    3: string buttonText;
    4: string iconUrl;
    5: string linkUrl;
    6: string tsTargetId;
}

struct MyRankBenefit {
    1: string rewardCouponCount;
    2: string rewardCouponCountLinkUrl;
    3: string payReturnPointRate;
    4: string payReturnPointRateLinkUrl;
}

enum RankType {
    REGULAR = 0,
    SILVER = 1,
    GOLD = 2,
    PLATINUM = 3
}

struct MyRank {
    1: RankType rankType;
    2: string rankName;
    3: string iconUrl;
    4: string linkUrl;
    5: MyRankBenefit myRankBenefit;
}

struct BalanceShortcut {
    1: bool osPayment;
    2: i32 iconPosition;
    3: string iconUrl;
    4: string iconText;
    5: string iconAltText;
    6: string linkUrl;
    7: string tsTargetId;
}

struct BalanceShortcutInfo {
    1: list<BalanceShortcut> balanceShortcuts;
    2: BalanceShortcut osPaymentFallbackShortcut;
}

struct GetBalanceSummaryResponseV2 {
    1: LinePayInfo payInfo;
    2: list<LinePayPromotion> payPromotions;
    3: MyRank myRank;
    4: LinePointInfo pointInfo;
    5: BalanceShortcutInfo balanceShortcutInfo;
}

struct GetBalanceSummaryRequestV2 {}

struct Module {
    1: string id;
    2: string templateName;
    3: map<string, string> fields;
    4: list<map<string, string>> elements;
    5: binary etag;
    6: i32 refreshTimeSec;
    7: string name;
    8: bool recommendable;
    9: string recommendedModelId;
}

struct ModuleResponse {
    1: Module moduleInstance;
}

struct NotModified {}

struct NotFound {}

struct GetModuleResponse {
    1: ModuleResponse moduleResponse;
    2: NotModified notModified;
    3: NotFound notFound;
}

struct GetModuleRequest {
    1: string id;
    2: binary etag;
    3: string recommendedModelId;
}

struct ModuleAggregationResponse {
    1: list<Module> modules;
    2: binary etag;
    3: i32 refreshTimeSec;
}

struct GetModulesResponse {
    1: ModuleAggregationResponse moduleAggregationResponse;
    2: NotModified notModified;
}

struct GetModulesRequest {
    1: binary etag;
}

struct ModuleAggregationResponseV2 {
    1: list<Module> fixedModules;
    2: binary etag;
    3: i32 refreshTimeSec;
    4: list<Module> recommendedModules;
}

struct GetModulesResponseV2 {
    1: ModuleAggregationResponseV2 moduleAggregationResponse;
    2: NotModified notModified;
}

struct GetModulesRequestV2 {
    1: binary etag;
}

enum IncentiveType {
    COUPON = 0,
    REWARD_CARD = 1,
    GIFT_POCHI = 2
}

struct Incentive {
    1: string title;
    2: IncentiveType type;
}

enum PromotionIcon {
    LINE_PAY = 0,
    LINE_POINT = 1
}

struct Promotion {
    1: string title;
    2: string oaMid;
    3: string accountName;
    4: string linkUrl;
    5: list<PromotionIcon> icons;
    6: Incentive primaryIncentive;
    7: string profileImageUrl;
}

struct Category {
    1: string name;
    2: string key;
}

struct GetPromotionsResponse {
    1: list<Promotion> promotions;
    2: string categorykey;
    3: list<Category> availableCategories;
    4: binary continuationToken;
}

struct Geolocation {
    1: double latitude;
    2: double longitude;
}

struct GetPromotionsRequest {
    1: string categoryKey;
    2: Geolocation geoLocation;
    3: binary continuationToken;
    4: i32 limit;
}

struct SmartChannelRecommendation {
    1: i32 minDisplayDuration;
    2: string title;
    3: string descriptionText;
    4: string labelText;
    5: string imageUrl;
    6: string bgColorCode;
    7: string linkUrl;
    8: string impEventUrl;
    9: string clickEventUrl;
    10: string muteEventUrl;
    11: string upvoteEventUrl;
    12: string downvoteEventUrl;
}

struct GetSmartChannelRecommendationsResponse {
    1: list<SmartChannelRecommendation> smartChannelRecommendations;
    2: i32 minInterval;
    3: string requestId;
}

struct GetSmartChannelRecommendationsRequest {
    1: i32 maxResults;
    2: string placement;
    3: bool testMode;
}

enum WalletErrorCode {
    AUTHENTICATION_FAILED = 401,
    INTERNAL_SERVER_ERROR = 500,
    SERVICE_IN_MAINTENANCE_MODE = 503
}

exception WalletException {
    1: WalletErrorCode code;
    2: string reason;
    3: map<string, string> attributes;
}

service WalletService {
    GetBalanceSummaryResponse getBalanceSummary(
        1: GetBalanceSummaryRequest request) throws (1: WalletException e);

    GetBalanceSummaryResponseV2 getBalanceSummaryV2(
        1: GetBalanceSummaryRequestV2 request) throws (1: WalletException e);

    GetModuleResponse getModule(
        1: GetModuleRequest request) throws (1: WalletException e);

    GetModulesResponse getModules(
        1: GetModulesRequest request) throws (1: WalletException e);

    GetModulesResponseV2 getModulesV2(
        1: GetModulesRequestV2 request) throws (1: WalletException e);

    GetPromotionsResponse getPromotions(
        1: GetPromotionsRequest request) throws (1: WalletException e);

    GetSmartChannelRecommendationsResponse getSmartChannelRecommendations(
        1: GetSmartChannelRecommendationsRequest request) throws (1: WalletException e);
}