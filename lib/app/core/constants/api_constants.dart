// Api Path  strings used local to the app
// ==========================================================

//below are api endpoint constants
const SEND_OTP_TO_REGISTER_ENDPOINT = "users/sendOtp/register";
const VERIFY_REGISTERATION_ENDPOINT = "users/otp/verify";
const SEND_OTP_MOBILE_ENDPOINT = "users/sendOtp/mobile";
const SEND_OTP_EMAIL_ENDPOINT = "users/sendOtp/email";
const LOGIN_WITH_EMAIL_OTP_ENPOINT = "users/login/email";
const LOGIN_WITH_MOBILE_OTP_ENPOINT = "users/login/mobile";
const LOGIN_WITH_EMAIL_PASSWORD_ENPOINT = "users/login/email/password";
const LOGIN_WITH_MOBILE_PASSWORD_ENPOINT = "users/login/mobile/password";
const CHANGE_PASSWORD_MOBILE_ENDPOINT = "users/changePassword/mobile";
const CHANGE_PASSWORD_EMAIL_ENDPOINT = "users/changePassword/email";
const VERIFY_OTP_MOBILE_ENDPOINT = "users/verifyOtp/mobile";
const VERIFY_OTP_EMAIL_ENDPOINT = "users/verifyOtp/email";
const DOCTOR_REGISTRATION_ENDPOINT = "users/:id/profile";
const GET_ALL_QUIZZES_ENDPOINT = "quizzes";
const QUIZ_ENDPOINT = "quizzes/";
const GET_QUIZ_QUESTIONS_ENDPOINT = "questions";
const GET_QUIZ_INFO_ENDPOINT = "quizzes/";

const ALL_COMMUNITIES_ENDPOINT = "v0/group/all-groups-new";
const MY_COMMUNITIES_ENDPOINT = "v0/group/index";
const CREATE_COMMUNITY_ENDPOINT = "v0/group/create";
const MEMBER_LIST_ENDPOINT = "v0/group/search-users";
const JOIN_COMMUNITY_ENDPOINT = "v0/group/invite";
const COMM_GROUP_REQUEST = "v0/group/private-community";
const COMM_INVITATION_REQUEST = "v0/group/invited-community";
const COMM_REQ_ACTION = "v0/group/accept-decline";
// const SEARCH_COMMUNITY_REQUEST = "v0/group/search";

const POST_LIKE_UNLIKE = "likes";
//const POST_DISLIKE = "likes/1111";
const ADD_FEED_POST = "feeds";
const POST_DETAIL = "feeds/";
//const POST_COMMENT_LIST = "feeds/:id/comments";
GET_COMMENT_LIST(String feedId) => "feeds/$feedId/comments";
POST_COMMENT_LIST(String feedId) => "feeds/$feedId/comments";
POST_COMMENT(String feedId, String userId) =>"feeds/$feedId/users/$userId/comments";
REPLY_COMMENT(String feedId, String commentId) =>"feeds/$feedId/comments/$commentId/sub_comments";

//address
const ADDRESS_LISTING_ENDPOINT = "v0/address/address";
const CREATE_ADDRESS_ENDPOINT = "v0/address/address";
const STATE_LISTING_API = "v0/address/state";
const MEDICINE_BOOKMARK_API = "v0/medicinebookmark/medicine-bookmark";
const DELETE_ADDRESS = "v0/address/address";

DOCTOR_REG_REQUEST(String userId) => "/users/$userId/dr-registration";
STUDENT_REG_REQUEST(String userId) => "/users/$userId/student-registration";
CHEMIST_REG_REQUEST(String userId) => "/users/$userId/chemist-registration";

//e-commerce module
const CATEGORY_LISTING_ENDPOINT = "v0/medicine/category-listing";
const PRODUCT_LISTING_ENDPOINT = "v0/medicine/listing";
const MEDCINE_DETAIL_ENDPOINT = "v0/medicine/medicine-detail";
const ADVANCE_MEDICINES = "v0/medicine/advance-cart";
const ADD_TO_CART_ENDPOINT = "v0/medicine/add-to-cart";
const CHECK_AVAILIBILITY_ENDPOINT = "v0/medicine/check-availability";
const REMOVE_ITEM_FROM_CART_ENDPOINT = "v0/medicine/remove-from-cart";

//
const CART_DETAILS_ENDPOINT = "v0/medicine/cart-details";

const CHECKOUT_DETAIL_ENDPOINT = "v0/medicine/checkout";
const PAY_ENDPOINT = "v0/medicine/pay";
const APPLY_COUPON_ENDPOINT = "v0/medicine/apply-coupon";
const REMOVE_COUPON_ENDPOINT = "v0/medicine/remove-coupon";


const APP_ID = 'NRGSRT\$(T(L5830FRU@!^AUSER';
