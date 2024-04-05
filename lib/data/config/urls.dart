import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

//http://89.236.219.33/GRMBASE/hs/mob_api/
const url = "http://89.236.219.33"; //server url
// const url = "http://84.54.115.206:8056"; //server url
const base = 'GRMBASE'; // base

const urlLogin = "$url/$base/hs/mob_api/login/";
const urlConfigure = "$url/$base/hs/mob_api/configure/";
const urlLogout = "$url/$base/hs/mob_api/logout/";
const urlProducts = "$url/$base/hs/mob_api/items/";
const urlRefuse = "$url/$base/hs/mob_api/refusal_sheet/";
const urlCart = "$url/$base/hs/mob_api/get_basket/";
const urlOrder = "$url/$base/hs/mob_api/write_order/";
const urlRefusal = "$url/$base/hs/mob_api/get_refusal_sheet/";
const urlSendCart = "$url/$base/hs/mob_api/write_basket/";
const urlSendRefusal = "$url/$base/hs/mob_api/write_refusal_sheet/";
const urlGetOrder = "$url/$base/hs/mob_api/get_orders/";
const urlOrderItem = "$url/$base/hs/mob_api/get_order/";
const urlConfirm = "$url/$base/hs/mob_api/confirm_sale/";
const urlAccepted = "$url/$base/hs/mob_api/accepted_sale/";
const urlReject = "$url/$base/hs/mob_api/cancel_order/";
const urlGetNews = "$url/$base/hs/mob_api/get_news/";
const urlGetNew = "$url/$base/hs/mob_api/get_new/";
const urlOpenNew = "$url/$base/hs/mob_api/on_open_new/";
const urlGetCountNew = "$url/$base/hs/mob_api/get_count_new/";
const urlReport = "$url/$base/hs/mob_api/act_sverki/";
const urlPrice = "$url/$base/hs/mob_api/price_list/";
const urlReference = "$url/$base/hs/mob_api/send_review/";
const urlCertificates = "$url/$base/hs/mob_api/get_certificate/";
const urlChangeLanguage = "$url/$base/hs/mob_api/change_language/";
const urlCertificate = "$url/$base/hs/mob_api/get_certificate_file?path=";

String? username = dotenv.env['USERNAME_AUTH'];
String? password = dotenv.env['PASSWORD_AUTH'];
String? basicAuth =
    'Basic ' + base64.encode(utf8.encode('$username:$password'));
