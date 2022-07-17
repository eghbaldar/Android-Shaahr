<%@ Control Language="VB" AutoEventWireup="false" CodeFile="footer.ascx.vb" Inherits="usercontrol_footer" %>
<hr style="box-shadow: 0px 1px 0px rgba(255,255,255,0.9); border: 1px solid #dbdbdb;" />
<div style="float: right; width: 1024px;" id="TopFooter">
    <div style="float: right; width: 230px; padding: 5px;">
        <div style="font-family: koodakAnd; font-size: 15px; color: #DF3D1B;">
            ارتباط با مدیر سایت</div>
        <hr style="box-shadow: 0px 1px 0px rgba(255,255,255,0.9); border: 1px solid #dbdbdb;" />
        <div style="text-align: left; color: #848484;">
            info@shaahr.com</div>
        <div style="text-align: left; color: #848484;">
            android@shaahr.com</div>
    </div>
    <div style="float: right; width: 180px; padding: 5px;">
        <div style="font-family: koodakAnd; font-size: 15px; color: #95C267;">
            محصولات شرکت</div>
        <hr style="box-shadow: 0px 1px 0px rgba(255,255,255,0.9); border: 1px solid #dbdbdb;" />
        <div>
            <a href="http://sms.shaahr.com" class="link">شهر اس ام اس</a></div>
        <div>
            <a href="http://shaahroid.ir" class="link">شهر اندروید</a></div>
        <div>
            <a href="http://software.shaahr.com" class="link">شهر نرم افزار</a></div>
        <div>
            <a href="http://ebook.shaahr.com" class="link">شهر کتاب</a></div>
    </div>
    <div style="float: right; width: 200px; padding: 5px;">
        <div style="font-family: koodakAnd; font-size: 15px; color: #860000;">
            شهر دات کام</div>
        <hr style="box-shadow: 0px 1px 0px rgba(255,255,255,0.9); border: 1px solid #dbdbdb;" />
        <div>
            <a href="http://shaahr.com" class="link">مشاهده سایت</a></div>
        <div>
            <a href="http://shaahr.com/about" class="link">درباره شرکت</a></div>
        <div>
            <a href="http://shaahr.com/contact" class="link">تماس با شرکت</a></div>
    </div>
</div>
<div style="text-align: center;">
    <a class="Aw" href="http://shaahr.com">
        <img src='<%= ResolveUrl("~/content/images/logo/logo_shaahr.png") %>' border="0"
            width="70" height="70" />
    </a><a class="Aw" href="http://sms.shaahr.com">
        <img src='<%= ResolveUrl("~/content/images/logo/logo_sms.png") %>' border="0" width="70"
            height="70" />
    </a><a class="Aw" href="http://software.shaahr.com">
        <img src='<%= ResolveUrl("~/content/images/logo/logo_software.png") %>' border="0"
            width="70" height="70" />
    </a><a class="Aw" href="http://ebook.shaahr.com">
        <img src='<%= ResolveUrl("~/content/images/logo/logo_ebook.png") %>' border="0" width="70"
            height="70" />
    </a><a class="Aw" style="text-decoration: none;" href="http://android.shaahr.com">
        <img src='<%= ResolveUrl("~/content/images/logo/logo_android.png") %>' border="0"
            width="70" height="70" />
    </a>
</div>
<hr style="box-shadow: 0px 1px 0px rgba(255,255,255,0.9); border: 1px solid #dbdbdb;" />
<div style="text-shadow: 0px 1px 0px rgba(255,255,255,0.9); color: #414141;">
    این وب سایت مجهز به دامین مستقل است با نام : <a href="http://Shaahroid.ir" target="_blank"
        style="color: blue; text-decoration: none;">Shaahroid.ir</a>
</div>
<div style="text-shadow: 0px 1px 0px rgba(255,255,255,0.9); color: #AAAAAA;">
    © تمام حقوق معنوی و مادی این وب سایت متعلق به شرکت دهکده مجازی کاسپین می باشد /
    هرگونه کپی برداری بدون نام بردن نام سایت ممنوع می باشد.
</div>
<style type="text/css">
    .link
    {
        font-family: koodakAnd;
        font-size: 11px;
        text-decoration: none;
        color: #414141;
        text-shadow: 0px 1px 0px rgba(255,255,255,0.9);
    }
    .Aw
    {
        text-decoration: none;
    }
</style>
