import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

RulesDialog(cntext) {
  String Rules_text = '''
 
 -این اپلیکیشن جهت آسان تر کردن دسترسی  شما به پنل اینترنت Adsl شرکت مخابرات ایران به آدرس Adsl.tci.ir طراحی و ساخته شده و اپلیکیشن رسمی این شرکت نمیباشد.
  
 - در این اپلیکیشن همه پرداخت ها به مرورگر دستگاه شما منتقل میشود و هیچگونه پرداختی در اپلیکیشن انجام نخواهد شد.
 
 -این اپلیکیشن اطلاعات شما را به صورت مستقیم از سایت شرکت مخابرات ایران به ادرس adsl.tci.ir  در یافت میکند و از هیچ گونه  Api در این اپلیکیشن استفاده نشده است.
 به همین جهت  هیچ گونه تضمینی  برای استفاده بلند مدت شما از  این اپلیکیشن نیست.

 
 -توسعه دهنده هیچ گونه مسِولیتی در قبال استفاده شما از این اپلیکیشن ندارد و هر گونه عواقب  بر عهده کاربر میباشد. 
 
 
  ''';

  showDialog(
      context: cntext,
      child: Dialog(
          child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.all(10),
          child:SingleChildScrollView(child: Text(
            Rules_text,
            softWrap: true,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ))));
}
