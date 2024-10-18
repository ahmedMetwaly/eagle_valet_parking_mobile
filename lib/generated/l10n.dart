// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Good morninig`
  String get goodMorning {
    return Intl.message(
      'Good morninig',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Wrong`
  String get wrong {
    return Intl.message(
      'Wrong',
      name: 'wrong',
      desc: '',
      args: [],
    );
  }

  /// `No Page Found`
  String get noRoute {
    return Intl.message(
      'No Page Found',
      name: 'noRoute',
      desc: '',
      args: [],
    );
  }

  /// `No Route Body`
  String get noRouteBody {
    return Intl.message(
      'No Route Body',
      name: 'noRouteBody',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgotPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or login with`
  String get loginWithSocialMedia {
    return Intl.message(
      'Or login with',
      name: 'loginWithSocialMedia',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Required Field`
  String get requiredField {
    return Intl.message(
      'Required Field',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Name`
  String get notValidName {
    return Intl.message(
      'Not Valid Name',
      name: 'notValidName',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message(
      'User name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `National id`
  String get nationalId {
    return Intl.message(
      'National id',
      name: 'nationalId',
      desc: '',
      args: [],
    );
  }

  /// `Already have an accoount`
  String get haveAccoount {
    return Intl.message(
      'Already have an accoount',
      name: 'haveAccoount',
      desc: '',
      args: [],
    );
  }

  /// `Signup  with social media`
  String get signUpWithSc {
    return Intl.message(
      'Signup  with social media',
      name: 'signUpWithSc',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email`
  String get notValidEmail {
    return Intl.message(
      'Please enter valid email',
      name: 'notValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Use 8 characters or more for your password`
  String get passErrorSignUp {
    return Intl.message(
      'Use 8 characters or more for your password',
      name: 'passErrorSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the News App`
  String get onboarding1Title {
    return Intl.message(
      'Welcome to the News App',
      name: 'onboarding1Title',
      desc: '',
      args: [],
    );
  }

  /// `Stay ahead of the curve with News! Personalize your news feed, receive breaking news alerts, and explore a world of information at your fingertips`
  String get onboarding1Body {
    return Intl.message(
      'Stay ahead of the curve with News! Personalize your news feed, receive breaking news alerts, and explore a world of information at your fingertips',
      name: 'onboarding1Body',
      desc: '',
      args: [],
    );
  }

  /// `Explore the World of News`
  String get onboarding2Title {
    return Intl.message(
      'Explore the World of News',
      name: 'onboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `Customize your news experience by choosing your favorite topics. From global events to niche interests, our app covers it all.`
  String get onboarding2Body {
    return Intl.message(
      'Customize your news experience by choosing your favorite topics. From global events to niche interests, our app covers it all.',
      name: 'onboarding2Body',
      desc: '',
      args: [],
    );
  }

  /// `Stay Informed, Anywhere`
  String get onboarding3Title {
    return Intl.message(
      'Stay Informed, Anywhere',
      name: 'onboarding3Title',
      desc: '',
      args: [],
    );
  }

  /// `Access breaking news and save articles. Share and discuss with your community, and dive into a world of knowledge on the go.`
  String get onboarding3Body {
    return Intl.message(
      'Access breaking news and save articles. Share and discuss with your community, and dive into a world of knowledge on the go.',
      name: 'onboarding3Body',
      desc: '',
      args: [],
    );
  }

  /// `Discover Hotest\nNews`
  String get discover {
    return Intl.message(
      'Discover Hotest\nNews',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirmDelete {
    return Intl.message(
      'Confirm Delete',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this item ?`
  String get deleteContent {
    return Intl.message(
      'Do you want to delete this item ?',
      name: 'deleteContent',
      desc: '',
      args: [],
    );
  }

  /// `No History`
  String get noHistory {
    return Intl.message(
      'No History',
      name: 'noHistory',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `You don't have a favorite yet!`
  String get noFavorite {
    return Intl.message(
      'You don\'t have a favorite yet!',
      name: 'noFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Search article, topic, writer`
  String get searchHint {
    return Intl.message(
      'Search article, topic, writer',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Trending topic today`
  String get trend {
    return Intl.message(
      'Trending topic today',
      name: 'trend',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Go To Link`
  String get goToLink {
    return Intl.message(
      'Go To Link',
      name: 'goToLink',
      desc: '',
      args: [],
    );
  }

  /// `By`
  String get by {
    return Intl.message(
      'By',
      name: 'by',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get enLang {
    return Intl.message(
      'English',
      name: 'enLang',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arLang {
    return Intl.message(
      'Arabic',
      name: 'arLang',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Search Result`
  String get searchResult {
    return Intl.message(
      'Search Result',
      name: 'searchResult',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message(
      'Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Email already exist try sign up with another email.`
  String get emailErrorSignUp {
    return Intl.message(
      'Email already exist try sign up with another email.',
      name: 'emailErrorSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `User name not found!`
  String get userError {
    return Intl.message(
      'User name not found!',
      name: 'userError',
      desc: '',
      args: [],
    );
  }

  /// `Email not found`
  String get emailNotFound {
    return Intl.message(
      'Email not found',
      name: 'emailNotFound',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is not correct`
  String get loginError {
    return Intl.message(
      'The email or password is not correct',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is not correct`
  String get noUser {
    return Intl.message(
      'The email or password is not correct',
      name: 'noUser',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrongPass {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrongPass',
      desc: '',
      args: [],
    );
  }

  /// `You are logout`
  String get loginAlertTitle {
    return Intl.message(
      'You are logout',
      name: 'loginAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please login to add this item to favorite.`
  String get loginAlertText {
    return Intl.message(
      'Please login to add this item to favorite.',
      name: 'loginAlertText',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `OR continue as a`
  String get continueAsGuest {
    return Intl.message(
      'OR continue as a',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Press back again to exit`
  String get exit {
    return Intl.message(
      'Press back again to exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Delete all items`
  String get clear {
    return Intl.message(
      'Delete all items',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `No back history found`
  String get noBack {
    return Intl.message(
      'No back history found',
      name: 'noBack',
      desc: '',
      args: [],
    );
  }

  /// `No forward history found`
  String get noForward {
    return Intl.message(
      'No forward history found',
      name: 'noForward',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get connectionError {
    return Intl.message(
      'Please check your internet connection',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasssword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasssword',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link sent to your email!`
  String get passwordReset {
    return Intl.message(
      'Password reset link sent to your email!',
      name: 'passwordReset',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email !`
  String get emailRequired {
    return Intl.message(
      'Please enter a valid email !',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry sometimes people can forget too, enter your email and we will send you a password reset link.`
  String get forgotPasswordDetails {
    return Intl.message(
      'Don\'t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
      name: 'forgotPasswordDetails',
      desc: '',
      args: [],
    );
  }

  /// `Your accoount security is our priority ! we've sent you a secure link to safely change your password and keep your account protected.`
  String get passwordResestDetails {
    return Intl.message(
      'Your accoount security is our priority ! we\'ve sent you a secure link to safely change your password and keep your account protected.',
      name: 'passwordResestDetails',
      desc: '',
      args: [],
    );
  }

  /// `Resend email`
  String get resendEmail {
    return Intl.message(
      'Resend email',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password reset email sent check your account.`
  String get checkYourEmail {
    return Intl.message(
      'Password reset email sent check your account.',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Sent`
  String get sent {
    return Intl.message(
      'Sent',
      name: 'sent',
      desc: '',
      args: [],
    );
  }

  /// `Good afternoon`
  String get goodAfternoon {
    return Intl.message(
      'Good afternoon',
      name: 'goodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good evining`
  String get goodEvening {
    return Intl.message(
      'Good evining',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// ` Confirm logout`
  String get confirmLogout {
    return Intl.message(
      ' Confirm logout',
      name: 'confirmLogout',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to logout ?`
  String get logoutDescription {
    return Intl.message(
      'Do you want to logout ?',
      name: 'logoutDescription',
      desc: '',
      args: [],
    );
  }

  /// `Email verfication sent.`
  String get emailVerficationSent {
    return Intl.message(
      'Email verfication sent.',
      name: 'emailVerficationSent',
      desc: '',
      args: [],
    );
  }

  /// `Email verfication sent check your email and click on the link then press done to login.\nif the email not sent to you please press on Resend email.`
  String get emailVerficationDescription {
    return Intl.message(
      'Email verfication sent check your email and click on the link then press done to login.\nif the email not sent to you please press on Resend email.',
      name: 'emailVerficationDescription',
      desc: '',
      args: [],
    );
  }

  /// `You made too many requests within a window of time and have been rate limited. Back off for a while`
  String get errorToManyRequests {
    return Intl.message(
      'You made too many requests within a window of time and have been rate limited. Back off for a while',
      name: 'errorToManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong on our side.`
  String get serverError {
    return Intl.message(
      'Something went wrong on our side.',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Articles 100+`
  String get articleCount {
    return Intl.message(
      'Articles 100+',
      name: 'articleCount',
      desc: '',
      args: [],
    );
  }

  /// `No internet conncetion`
  String get noConnection {
    return Intl.message(
      'No internet conncetion',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `The internet conncetion is not stable !`
  String get internetNotStable {
    return Intl.message(
      'The internet conncetion is not stable !',
      name: 'internetNotStable',
      desc: '',
      args: [],
    );
  }

  /// `An Error has occurred, please try again later !`
  String get unKnownError {
    return Intl.message(
      'An Error has occurred, please try again later !',
      name: 'unKnownError',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Create accoount`
  String get createAccount {
    return Intl.message(
      'Create accoount',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Find place`
  String get findPlace {
    return Intl.message(
      'Find place',
      name: 'findPlace',
      desc: '',
      args: [],
    );
  }

  /// `Please wait`
  String get pleaseWait {
    return Intl.message(
      'Please wait',
      name: 'pleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `Select place`
  String get selectPlace {
    return Intl.message(
      'Select place',
      name: 'selectPlace',
      desc: '',
      args: [],
    );
  }

  /// `place is not in area`
  String get placeIsNotInArea {
    return Intl.message(
      'place is not in area',
      name: 'placeIsNotInArea',
      desc: '',
      args: [],
    );
  }

  /// `Your address`
  String get yourAddress {
    return Intl.message(
      'Your address',
      name: 'yourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account`
  String get alreadyHaveAccoount {
    return Intl.message(
      'Already have an account',
      name: 'alreadyHaveAccoount',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `January`
  String get January {
    return Intl.message(
      'January',
      name: 'January',
      desc: '',
      args: [],
    );
  }

  /// `February`
  String get February {
    return Intl.message(
      'February',
      name: 'February',
      desc: '',
      args: [],
    );
  }

  /// `March`
  String get March {
    return Intl.message(
      'March',
      name: 'March',
      desc: '',
      args: [],
    );
  }

  /// `April`
  String get April {
    return Intl.message(
      'April',
      name: 'April',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get May {
    return Intl.message(
      'May',
      name: 'May',
      desc: '',
      args: [],
    );
  }

  /// `June`
  String get June {
    return Intl.message(
      'June',
      name: 'June',
      desc: '',
      args: [],
    );
  }

  /// `July`
  String get July {
    return Intl.message(
      'July',
      name: 'July',
      desc: '',
      args: [],
    );
  }

  /// `August`
  String get August {
    return Intl.message(
      'August',
      name: 'August',
      desc: '',
      args: [],
    );
  }

  /// `September`
  String get September {
    return Intl.message(
      'September',
      name: 'September',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get October {
    return Intl.message(
      'October',
      name: 'October',
      desc: '',
      args: [],
    );
  }

  /// `November`
  String get November {
    return Intl.message(
      'November',
      name: 'November',
      desc: '',
      args: [],
    );
  }

  /// `December`
  String get December {
    return Intl.message(
      'December',
      name: 'December',
      desc: '',
      args: [],
    );
  }

  /// `Add new parking`
  String get addNewParking {
    return Intl.message(
      'Add new parking',
      name: 'addNewParking',
      desc: '',
      args: [],
    );
  }

  /// `Available parking`
  String get availableParking {
    return Intl.message(
      'Available parking',
      name: 'availableParking',
      desc: '',
      args: [],
    );
  }

  /// `Parking information`
  String get parkingInformation {
    return Intl.message(
      'Parking information',
      name: 'parkingInformation',
      desc: '',
      args: [],
    );
  }

  /// `Parking name`
  String get parkingName {
    return Intl.message(
      'Parking name',
      name: 'parkingName',
      desc: '',
      args: [],
    );
  }

  /// `Parking capacity`
  String get capacity {
    return Intl.message(
      'Parking capacity',
      name: 'capacity',
      desc: '',
      args: [],
    );
  }

  /// `Parking fee`
  String get parkingFee {
    return Intl.message(
      'Parking fee',
      name: 'parkingFee',
      desc: '',
      args: [],
    );
  }

  /// `Add new employee`
  String get addNewEmployer {
    return Intl.message(
      'Add new employee',
      name: 'addNewEmployer',
      desc: '',
      args: [],
    );
  }

  /// `First employee`
  String get firstEmployer {
    return Intl.message(
      'First employee',
      name: 'firstEmployer',
      desc: '',
      args: [],
    );
  }

  /// `Add employees`
  String get addEmployers {
    return Intl.message(
      'Add employees',
      name: 'addEmployers',
      desc: '',
      args: [],
    );
  }

  /// `Edit employees`
  String get editEmployees {
    return Intl.message(
      'Edit employees',
      name: 'editEmployees',
      desc: '',
      args: [],
    );
  }

  /// `Add parking`
  String get addParking {
    return Intl.message(
      'Add parking',
      name: 'addParking',
      desc: '',
      args: [],
    );
  }

  /// `Number of customers`
  String get totalCustomersOfToday {
    return Intl.message(
      'Number of customers',
      name: 'totalCustomersOfToday',
      desc: '',
      args: [],
    );
  }

  /// `Live overview`
  String get liveOverView {
    return Intl.message(
      'Live overview',
      name: 'liveOverView',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Total income`
  String get totalIncome {
    return Intl.message(
      'Total income',
      name: 'totalIncome',
      desc: '',
      args: [],
    );
  }

  /// `KWD`
  String get currency {
    return Intl.message(
      'KWD',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `This parking is still closing`
  String get thisParkingIsStillClosing {
    return Intl.message(
      'This parking is still closing',
      name: 'thisParkingIsStillClosing',
      desc: '',
      args: [],
    );
  }

  /// `Transaction in`
  String get transactionOf {
    return Intl.message(
      'Transaction in',
      name: 'transactionOf',
      desc: '',
      args: [],
    );
  }

  /// `Select month`
  String get selectMonth {
    return Intl.message(
      'Select month',
      name: 'selectMonth',
      desc: '',
      args: [],
    );
  }

  /// `All months`
  String get allMonths {
    return Intl.message(
      'All months',
      name: 'allMonths',
      desc: '',
      args: [],
    );
  }

  /// `View details`
  String get viewDetails {
    return Intl.message(
      'View details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `This month is currently unavailable`
  String get monthError {
    return Intl.message(
      'This month is currently unavailable',
      name: 'monthError',
      desc: '',
      args: [],
    );
  }

  /// `Parking does not exist`
  String get document_does_not_exist {
    return Intl.message(
      'Parking does not exist',
      name: 'document_does_not_exist',
      desc: '',
      args: [],
    );
  }

  /// `Tickets`
  String get tickets {
    return Intl.message(
      'Tickets',
      name: 'tickets',
      desc: '',
      args: [],
    );
  }

  /// `Ticket number`
  String get ticketNo {
    return Intl.message(
      'Ticket number',
      name: 'ticketNo',
      desc: '',
      args: [],
    );
  }

  /// `Enter time`
  String get enterTime {
    return Intl.message(
      'Enter time',
      name: 'enterTime',
      desc: '',
      args: [],
    );
  }

  /// `Leave time`
  String get leaveTime {
    return Intl.message(
      'Leave time',
      name: 'leaveTime',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Still inside`
  String get stillInside {
    return Intl.message(
      'Still inside',
      name: 'stillInside',
      desc: '',
      args: [],
    );
  }

  /// `Compare between parkings`
  String get compare_between_parkings {
    return Intl.message(
      'Compare between parkings',
      name: 'compare_between_parkings',
      desc: '',
      args: [],
    );
  }

  /// `Sales with KWD`
  String get sales {
    return Intl.message(
      'Sales with KWD',
      name: 'sales',
      desc: '',
      args: [],
    );
  }

  /// `Edit name`
  String get editName {
    return Intl.message(
      'Edit name',
      name: 'editName',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Employee`
  String get employer {
    return Intl.message(
      'Employee',
      name: 'employer',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields and must have at least 1 employee`
  String get editSnackBar {
    return Intl.message(
      'Please fill all fields and must have at least 1 employee',
      name: 'editSnackBar',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this employee?`
  String get delete_employer_message {
    return Intl.message(
      'Are you sure you want to delete this employee?',
      name: 'delete_employer_message',
      desc: '',
      args: [],
    );
  }

  /// `Employees`
  String get employers {
    return Intl.message(
      'Employees',
      name: 'employers',
      desc: '',
      args: [],
    );
  }

  /// `Updating`
  String get updating {
    return Intl.message(
      'Updating',
      name: 'updating',
      desc: '',
      args: [],
    );
  }

  /// `Employees added successfully`
  String get employersAddedSucss {
    return Intl.message(
      'Employees added successfully',
      name: 'employersAddedSucss',
      desc: '',
      args: [],
    );
  }

  /// `Employee data edited successfully`
  String get employerEditSuccess {
    return Intl.message(
      'Employee data edited successfully',
      name: 'employerEditSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Display employeees data`
  String get showEmployers {
    return Intl.message(
      'Display employeees data',
      name: 'showEmployers',
      desc: '',
      args: [],
    );
  }

  /// `Delete this parking`
  String get deleteThisParking {
    return Intl.message(
      'Delete this parking',
      name: 'deleteThisParking',
      desc: '',
      args: [],
    );
  }

  /// `Parking deleted successfully`
  String get parkingDeletedSuccessfully {
    return Intl.message(
      'Parking deleted successfully',
      name: 'parkingDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Adding new parking in progress`
  String get addingNewParking {
    return Intl.message(
      'Adding new parking in progress',
      name: 'addingNewParking',
      desc: '',
      args: [],
    );
  }

  /// `Deleting in progress`
  String get deletingInProgress {
    return Intl.message(
      'Deleting in progress',
      name: 'deletingInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Getting parkings data in progress`
  String get gettingParkingsData {
    return Intl.message(
      'Getting parkings data in progress',
      name: 'gettingParkingsData',
      desc: '',
      args: [],
    );
  }

  /// `Editing parking in progress`
  String get edittingParking {
    return Intl.message(
      'Editing parking in progress',
      name: 'edittingParking',
      desc: '',
      args: [],
    );
  }

  /// `Updating data in progress`
  String get updatingDataInProgress {
    return Intl.message(
      'Updating data in progress',
      name: 'updatingDataInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Adding new employees`
  String get addingNewEmployers {
    return Intl.message(
      'Adding new employees',
      name: 'addingNewEmployers',
      desc: '',
      args: [],
    );
  }

  /// `Getting employees data`
  String get gettingEmployersData {
    return Intl.message(
      'Getting employees data',
      name: 'gettingEmployersData',
      desc: '',
      args: [],
    );
  }

  /// `National ID must be 12 digits`
  String get enterValidNationalId {
    return Intl.message(
      'National ID must be 12 digits',
      name: 'enterValidNationalId',
      desc: '',
      args: [],
    );
  }

  /// `National ID must cantaions only digits`
  String get nationalIdError {
    return Intl.message(
      'National ID must cantaions only digits',
      name: 'nationalIdError',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get hours {
    return Intl.message(
      'Hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Total numbers of customers`
  String get totalCustomer {
    return Intl.message(
      'Total numbers of customers',
      name: 'totalCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid phone number`
  String get enterValidNumber {
    return Intl.message(
      'Enter valid phone number',
      name: 'enterValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Total income of today`
  String get totalIncomeOfToday {
    return Intl.message(
      'Total income of today',
      name: 'totalIncomeOfToday',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
