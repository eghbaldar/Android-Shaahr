<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmNewsLetter.aspx.vb" Inherits="UserControl_frmNewsLetter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        .FeedContext
        {
            border: 1px solid #ccc;
            padding: 3px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;   direction:rtl;
            font:normal 11px tahoma;
            width:200px;
        }
        .FeedTitle
        {
            background-color: #F18322;
            padding: 6px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            color:White;
        }
        .FeedText
        {
            text-align: center;
            padding: 3px;
            font-size: 12px;
        }
        .FeedTXT
        {
            border: 3px solid #ccc;
            padding: 5px;
            width: 176px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            direction: ltr;
            margin-right: 3px;
        }
        .FeedTXT:hover
        {
            border: 2px solid #D46500;
        }
        .FeedBtn
        {
            padding: 3px;
            border: 1px solid #ccc;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            margin-bottom: 2px;
            width: 100px;
            font: normal 11px tahoma;
            background: #f7fbfc; /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIxMDAlIiB5Mj0iMTAwJSI+CiAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdG9wLWNvbG9yPSIjZjdmYmZjIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iNDAlIiBzdG9wLWNvbG9yPSIjZDllZGYyIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI2FkZDllNCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
            background: -moz-linear-gradient(-45deg, #f7fbfc 0%, #d9edf2 40%, #add9e4 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, right bottom, color-stop(0%,#f7fbfc), color-stop(40%,#d9edf2), color-stop(100%,#add9e4)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(-45deg, #f7fbfc 0%,#d9edf2 40%,#add9e4 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(-45deg, #f7fbfc 0%,#d9edf2 40%,#add9e4 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(-45deg, #f7fbfc 0%,#d9edf2 40%,#add9e4 100%); /* IE10+ */
            background: linear-gradient(135deg, #f7fbfc 0%,#d9edf2 40%,#add9e4 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f7fbfc', endColorstr='#add9e4',GradientType=1 ); /* IE6-8 fallback on horizontal gradient */
        }
        .FeedBtn:hover
        {
            cursor: pointer;
            color: White;
            background: #49c0f0; /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIxMDAlIiB5Mj0iMTAwJSI+CiAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdG9wLWNvbG9yPSIjNDljMGYwIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzJjYWZlMyIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
            background: -moz-linear-gradient(-45deg, #49c0f0 0%, #2cafe3 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, right bottom, color-stop(0%,#49c0f0), color-stop(100%,#2cafe3)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(-45deg, #49c0f0 0%,#2cafe3 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(-45deg, #49c0f0 0%,#2cafe3 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(-45deg, #49c0f0 0%,#2cafe3 100%); /* IE10+ */
            background: linear-gradient(135deg, #49c0f0 0%,#2cafe3 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#49c0f0', endColorstr='#2cafe3',GradientType=1 ); /* IE6-8 fallback on horizontal gradient */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" action="http://feedburner.google.com/fb/a/mailverify"
    method="post" target="popupwindow"
     onsubmit="window.open('http://feedburner.google.com/fb/a/mailverify?uri=shaahr_android', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true">
    <div class="FeedContext">
        <div class="FeedTitle">
            عضویت در خبرنامه شهروید</div>
        <div class="FeedText">
            پس از وارد کردن ایمیل خود در کادر زیر ، برای فعالسازی آن می بایست ، بروی لینک فعالسازی
            ارسال شده به ایمیلتان کلیک کنید ، در غیر این صورت اشتراک شما غیر فعال خواهد ماند.
        </div>
        <div>
            <input type="text" class="FeedTXT" name="email" />
        </div>
        <div style="text-align: center; padding-top: 5px;">
            <input type="hidden" value="shaahr_android" name="uri" />
            <input type="hidden" name="loc" value="en_US" />
            <input type="submit" class="FeedBtn" value="عضویت" />
        </div>
    </div>
    </form>
</body>
</html>
