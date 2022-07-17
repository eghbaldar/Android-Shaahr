Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Net.Mail
Imports System.Net
Imports System.Data


Public Class mail

    Dim ClassAnd As New Newsletter

    Public Function SentMail(ByVal ToEmail As String, ByVal subject As String, ByVal Body As String) As Boolean

        Dim objMail As New MailMessage("shaahroid@shaahr.ir", ToEmail, subject, Body)

        Dim objNC As New NetworkCredential("shaahroid@shaahr.ir", "Shaahr17730@")
        Dim objsmtp As New SmtpClient("mail.shaahr.ir", 2525)
        objsmtp.EnableSsl = False
        objMail.IsBodyHtml = True
        objsmtp.Credentials = objNC
        objsmtp.Send(objMail)

    End Function

    Sub MailContentNewsLetter()

        For i As Integer = 0 To ClassAnd.getListOfEmailNewsLetter.Rows.Count - 1
            Dim row As DataRow = ClassAnd.getListOfEmailNewsLetter.Rows(i)
            Dim body As String = "<div style='border: 1px solid #ccc; padding: 2px; -moz-border-radius: 5px; -webkit-border-radius: 5px;" + _
       "border-radius: 5px; width: 513px; font-family: Tahoma; font-size: 11px; direction: rtl;'>" + _
       "<div style='border: 1px solid #ccc; padding: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;" + _
           "border-radius: 5px; width: 500px; direction: rtl; font-family: Tahoma; font-size: 12px;" + _
           "background-color: #D1E4EA;'>" + _
           "<table style='font-family:tahoma;'>" + _
               "<tr>" + _
                   "<td>" + _
                      "<a href='http://shaahroid.ir' style='text-decoration:none;'>بروزرسانی شهروید ، شهری برای دانلود و کسب اطلاعات آندرویدی</a>" + _
                   "</td>" + _
              " </tr>" + _
          " </table>" + _
       "</div>" + _
       "<div style='border: 1px solid #C2DDE4; padding: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;" + _
           "border-radius: 5px; width: 500px; direction: rtl; background-color: #EAF3F6;" + _
           "margin-top: 2px;' > " + _
           "<table style='font-family:tahoma;'>" + _
              " <tr>" + _
                  " <td>" + _
                 String.Format("{0} عزیز،", row.Item("name")) + _
                  " </td>" + _
             "  </tr>" + _
              " <tr>" + _
                   "<td>" + _
                       "آگاه سازی از آخرین پست بازی و برنامه شهروید" + _
                   "</td>" + _
            "   </tr>" + _
           "</table>" + _
     "  </div>" + _
       "<div style='border: 1px solid #000; padding: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;" + _
          " border-radius: 5px; width: 500px; direction: rtl; background-color: #f4f4f4;" + _
           "margin-top: 2px; color: Blue;'>" + _
       getLastAndroid() + _
       "</div><div style='padding-top:5px;padding-bottom:5px;'>" + getPicturePost() + "</div>" + _
       "<div style='border: 1px solid #ccc; padding: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;" + _
           "border-radius: 5px; width: 500px; direction: rtl; background-color: #f7f7f7;" + _
           "margin-top: 2px; text-align: center; font-weight: bold;color:gray;'>" + _
       "هم اکنون می توانید برنامه و یا بازی بروز شده را دانلود کنید" + _
       "</div>" + _
        "<div style='border: 1px solid #4485F3; padding: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;" + _
           "border-radius: 5px; width: 500px; direction: rtl; background-color: #F5F5F5;" + _
           "margin-top: 2px; text-align: right; font-weight: bold;'><div style='text-align:right;'>" + _
       "محصولات دیگر شرکت دهکده مجازی کاسپین عبارتنداز:" + "</div><br/><div style='text-align:left;'>" + "<a href='http://sms.shaahr.com'>sms.shaahr.com</a>" + "<br/><br/>" + "<a href='http://software.shaahr.com'>software.shaahr.com</a>" + "<br/><br/>" + "<a href='http://ebook.shaahr.com'>ebook.shaahr.com</a></div>" + _
       "</div>" + _
       "<div style='border: 1px solid #4485F3; padding: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px;" + _
           "border-radius: 5px; width: 500px; direction: rtl; background-color: #F5F5F5;" + _
           "margin-top: 2px; text-align: right; font-weight: bold;text-align:center;'>" + _
            "<a href='http://shaahr.com'><img src='http://shaahr.com/logo_shaahr.png' border='0' /></a>   <a href='http://sms.shaahr.com'><img src='http://shaahr.com/logo_sms.png' border='0' /></a> <a href='http://ebook.shaahr.com'><img src='http://shaahr.com/logo_ebook.png' border='0' /></a><a  href='http://android.shaahr.com'><img src='http://shaahr.com/logo_android.png' border='0' /></a><a  href='http://software.shaahr.com'><img src='http://shaahr.com/logo_software.png' border='0' /></a>" + _
       "</div>" + _
   "</div>"

            SentMail(row.Item("email"), "بروز رسانی شهروید - شهر اندروید شما", body)
            'SentMail("mrb_developer@yahoo.com", "بروز رسانی شهروید - شهر اندروید", body)
            'SentMail("ali.eghbaldar2@gmail.com", "بروز رسانی شهروید - شهر اندروید", body)
            'Exit For
        Next

    End Sub

    Private Function getLastAndroid() As String

        Return "<a href='" + "http://android.shaahr.com/Post/" + ClassAnd.getLastAndroid("code").ToString + "/" + ClassAnd.getLastAndroid("title").ToString + "'" _
            + "' target='_blank' style='font-family:tahoma;font-size:23px;color:red;text-decoration:none;' >" & ClassAnd.getLastAndroid("title").ToString & "</a>"

    End Function

    Private Function getPicturePost() As String
        Return "<a href='" + "http://android.shaahr.com/Post/" + ClassAnd.getLastAndroid("code").ToString + "/" + ClassAnd.getLastAndroid("title").ToString + "'" _
                + "' target='_blank' style='font-family:tahoma;font-size:23px;color:red;' >" & _
                "<img src='" + "http://android.shaahr.com/management/images/" + ClassAnd.getLastAndroid("picturepath").ToString + "' border='0' style='width:508px;' />" & "</a>"
    End Function

End Class
