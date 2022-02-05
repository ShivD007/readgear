import 'package:readgear/app/core/constants/string_constants.dart';

import 'constants/value_constants.dart';

class ValidationFunctions {
  static String? validatePassword(String? value) {
    var pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);

    if (value!.isEmpty) {
      return ENTER_PASSWORD;
    } else {
      if (!regex.hasMatch(value)) {
        return ENTER_VALID_PASSWORD;
      } else {
        return null;
      }
    }
  }

  static String? validatereEnteredPassword(String? value,
      {required String alrdyEnteredPassword}) {
    var pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);

    if (value!.isEmpty) {
      return RE_ENTER_PASSWORD;
    } else if (alrdyEnteredPassword != value) {
      return INCORRECT_PASSWORD;
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (value!.isEmpty) {
      return ENTER_EMAIL;
    } else if (!regex.hasMatch(value)) {
      return ENTER_VALID_EMAIL;
    } else {
      return null;
    }
  }

  static bool isEmail(String? value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (value!.isEmpty) {
      return false;
    } else if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static String? validateTitle(String? value) {
    if (value!.isEmpty) {
      return SELECT_PROFESSION;
    } else {
      return null;
    }
  }

  static String? validateProfession(String? value) {
    if (value!.isEmpty) {
      return SELECT_PROFESSION;
    } else {
      return null;
    }
  }

  static String? validateEmailPhone(String? value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    String _numericPattern = r'^-?[0-9]+$';
    RegExp numericRegex = RegExp(_numericPattern);
    if (value!.isEmpty) {
      return ENTER_EMAIL_PHONE;
    } else {
      if (numericRegex.hasMatch(value)) {
        if (value.length <= 9 || value.length > 10)
          return ENTER_VALID_PHONE;
        else
          return null;
      } else if (!regex.hasMatch(value)) {
        return ENTER_VALID_EMAIL;
      } else {
        return null;
      }
    }
  }

  // create account validations
  static String? validateName(String? value) {
    final RegExp nameRegExp = RegExp('[a-zA-ZäöüßÄÖÜ]');
    if (value!.isEmpty) {
      return ENTER_NAME;
    } else if (!nameRegExp.hasMatch(value)) {
      return ENTER_VALID_NAME;
    } else {
      return null;
    }
  }

  static String? validatePhone(String? value) {
    String _numericPattern = r'^-?[0-9]+$';
    RegExp numericRegex = RegExp(_numericPattern);
    if (value!.isEmpty) {
      return ENTER_PHONE;
    } else if (numericRegex.hasMatch(value)) {
      if (value.length <= 9 || value.length > 10)
        return ENTER_VALID_PHONE;
      else
        return null;
    }
  }

  static String? validateAlternatePhone(String? value, String? mobilenumber) {
    if (value!.isEmpty) {
      return ENTER_PHONE;
    } else if (value.length <= 9 || value.length > 10)
      return ENTER_VALID_PHONE;
    else if (value == mobilenumber) {
      return ENTER_VALID_ALTERNATE_PHONE;
    } else
      return null;
  }

  // static String? validateEmail(String? value) {
  //   String pattern =
  //       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
  //       r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
  //       r"{0,253}[a-zA-Z0-9])?)*$";
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value!)) {
  //     return 'Enter a valid email address';
  //   } else {
  //     return null;
  //   }
  // }

  static String? validatePincode(String? value) {
    // String _numericPattern = r'^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$';
    String _numericPattern = r'^[1-9]{1}[0-9]{2}[0-9]{3}$';
    RegExp numericRegex = RegExp(_numericPattern);
    if (value!.isEmpty) {
      return ENTER_PINCODE;
    } else if (value.length != 6)
      return ENTER_VALID_PINCODE;
    else
      return null;
  }

  //validation for experience
  static String? validateExperienceData(
      {String? hospitalName,
      String? from,
      String? to,
      String? city,
      bool? currentlyWorking = false}) {
    if (from == null || from.isEmpty) return ENTER_START_YEAR;

    if (!currentlyWorking!) {
      if (to == null || to.isEmpty)
        return ENTER_END_YEAR;
      else if (int.parse(from.trim()) > int.parse(to.trim()))
        return ENTER_VALID_YEAR;
      else if (city == null || city.isEmpty)
        return ENTER_CITY;
      else if (hospitalName == null || hospitalName.isEmpty)
        return ENTER_HOSPITAL_NAME;
      else
        return null;
    } else {
      if (city == null || city.isEmpty)
        return ENTER_CITY;
      else if (hospitalName == null || hospitalName.isEmpty)
        return ENTER_HOSPITAL_NAME;
      else
        return null;
    }
  }

  static String? validateEducation({
    String? qualification,
    String? university,
    String? passingYear,
    String? medicalDocument,
  }) {
    if (qualification == null || qualification.isEmpty)
      return ENTER_QUALIFICATION;
    else if (university == null || university.isEmpty) {
      return ENTER_UNIVERSITY;
    } else if (passingYear == null || passingYear.isEmpty) {
      return ENTER_PASSING_YEAR;
    } else if (medicalDocument == null) {
      return UPLOAD_MEDICAL_DOCUMENT;
    } else
      return null;
  }

  // registration validation
  static String? validateChemistDoc(String? value) {
    if (value == null || value.isEmpty) {
      return UPLOAD_DOCUMENT;
    } else {
      return null;
    }
  }

  // registration validation
  static String? validateIDFrontDoc(String? value) {
    if (value == null || value.isEmpty) {
      return UPLOAD_FRONT_CLG_ID;
    } else {
      return null;
    }
  }

  static String? validateIDBackDoc(String? value) {
    if (value == null || value.isEmpty) {
      return UPLOAD_BACK_CLG_ID;
    } else {
      return null;
    }
  }

  static String? validateMedicalFile(String? value) {
    if (value == null || value.isEmpty) {
      return UPLOAD_MED_DOC;
    } else {
      return null;
    }
  }

  static String? validateDegreeFile(String? value) {
    if (value == null || value.isEmpty) {
      return UPLOAD_DEGREE;
    } else {
      return null;
    }
  }

  // static String? validateRegistrationDetail({
  //   required ProfileType profileType,
  //   // for doctor
  //   String? councilType,
  //   String? councilName,
  //   String? medicalRegNo,
  //   String? medicalDoc,
  //   String? degreeDoc,
  //   String? year,

  //   // for students
  //   String? rollNo,
  //   String? currentYear,
  //   String? collegeIdFrontDoc,
  //   String? collegeIdBackDoc,

  //   // for chemist
  //   String? docType,
  //   String? docNo,
  //   String? doc,
  // }) {
  //   if (profileType == ProfileType.Doctor) {
  //     if (councilType == null || councilType.isEmpty)
  //       return SELECT_COUNCIL_TYPE;
  //     else if (councilName == null || councilName.isEmpty) {
  //       return ENTER_COUNCIL_NAME;
  //     } else if (medicalRegNo == null || medicalRegNo.isEmpty) {
  //       return ENTER_MED_REG_NO;
  //     } else if (year == null || year.isEmpty) {
  //       return SELECT_YEAR;
  //     } else if (medicalDoc == null) {
  //       return UPLOAD_MED_DOC;
  //     } else if (degreeDoc == null) {
  //       return UPLOAD_DEGREE;
  //     } else
  //       return null;
  //   } else if (profileType == ProfileType.Student) {
  //     if (rollNo == null || rollNo.isEmpty)
  //       return ENTER_ROLL_NO;
  //     else if (currentYear == null || currentYear.isEmpty) {
  //       return ENTER_CURRENT_YEAR;
  //     } else if (collegeIdFrontDoc == null) {
  //       return UPLOAD_FRONT_CLG_ID;
  //     } else if (collegeIdBackDoc == null) {
  //       return UPLOAD_BACK_CLG_ID;
  //     } else
  //       return null;
  //   } else {
  //     if (docType == null || docType.isEmpty) {
  //       return SELECT_DOC_TYPE;
  //     } else if (docNo == null || docNo.isEmpty) {
  //       return ENTER_CHEMIST_DOC_NO;
  //     } else if (doc == null) {
  //       return UPLOAD_DOCUMENT;
  //     } else
  //       return null;
  //   }
  // }

  static String? validateAward({
    String? awardName,
    String? year,
  }) {
    if (awardName == null || awardName.isEmpty)
      return ENTER_AWARD_NAME;
    else if (year == null || year.isEmpty) {
      return ENTER_YEAR;
    } else
      return null;
  }

  static String? validateMembership({
    String? membershipDetail,
  }) {
    if (membershipDetail == null || membershipDetail.isEmpty)
      return ENTER_MEMBERSHIP_DETAIL;
    else
      return null;
  }

  static String? validatePersonalDetail({
    String? fullName,
    String? pincode,
  }) {
    final _errorMsg = validateName(fullName);
    if (_errorMsg != null) {
      return _errorMsg;
    }
    return validatePincode(pincode);
  }

// community validation
  static String? validateCommunityName(String? value) {
    if (value!.isEmpty) {
      return ENTER_COMMUNITY_NAME;
    } else {
      return null;
    }
  }

  static String? validateDescription(String? value) {
    if (value!.isEmpty) {
      return ENTER_COMMUNITY_DESCRIPTION;
    } else {
      return null;
    }
  }

  static String? validateAddMember(String? value) {
    if (value!.isEmpty) {
      return ENTER_ADD_MEMBER;
    } else {
      return null;
    }
  }

  static String? validateCommunityPrivacy(String? value) {
    if (value!.isEmpty) {
      return SELECT_COMMUNITY_PRIVACY;
    } else {
      return null;
    }
  }
}
