
Partial Class req
    Inherits System.Web.UI.Page

    Dim android_ As New Android

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Select Case Request.QueryString("req")
            Case "r"
                Title = "درخواست برنامه و بازی آندرویدی"
                title_.Text = " درخواست برنامه و بازی آندرویدی"
                lblTitle.Text = "راهنمای درخواست برنامه"
                lblDetail.Text = "دوستان عزیز این بخش یکی از تفاوت های سایت ما با سایر سایت ها می باشد ، یکی از علت هایی که سایت ها این امکان را برای کابران نمی گذارند سختی فرآیند آن است . بنابراین ابتدا نرم افزار مورد نظر خود را در سایت جستجو کنید و در صورت عدم وجود آن درخواست  خود را ارسال کنید."
                MultiView.ActiveViewIndex = 0
            Case "b"
                Title = "فروش آندروید های شما "
                title_.Text = "فروش آندروید های شما "
                lblTitle.Text = "راهنمای فروش برنامه"
                lblDetail.text = "برای فروش نرم افزار ها و بازی های شما فقط کافی است ، برنامه و قیمت پیشنهادی خود را برای ما ارسال کنید تا ما آن برنامه را برای کاربران به نمایش درآوریم."
                MultiView.ActiveViewIndex = 1
        End Select
    End Sub

    Protected Sub btnInsertReq_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertReq.Click

        If txtReg_name.Text.Trim = "نام شما..." Or txtReg_email.Text.Trim = "پست الکترونیک شما..." Or txtReg_detail.Text.Trim = "توضیحات شما..." Then
            divWrong.Visible = True
            lblWrong.Text = "فیلد های نام ، ایمیل و توضیحات باید پر شوند."
            Exit Sub
        End If
        divWrong.Visible = False
        android_.InsertReq(txtReg_name.Text, txtReg_email.Text, txtReg_phone.Text, txtReg_detail.Text, txtReg_link.Text, "", True)
        MultiView.ActiveViewIndex = 2
        success.Visible = False
        title_.Visible = False

    End Sub

    Protected Sub btnInsertBuy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertBuy.Click

        If txtBug_name.Text.Trim = "نام شما..." Or txtBug_email.Text.Trim = "پست الکترونیک شما..." Or txtBuy_detail.Text.Trim = "توضیحات شما..." Or txtBuy_link.Text.Trim = "لینک برنامه شما..." Or txtBuy_price.Text.Trim = "قیمت پیشنهادی شما..." Then
            divWrong.Visible = True
            lblWrong.Text = "فیلد های نام ، ایمیل ، توضیخات ، لینک برنامه و قیمت برنامه باید پر شوند."
            Exit Sub
        End If
        divWrong.Visible = False
        android_.InsertReq(txtBug_name.Text, txtBug_email.Text, txtBug_phone.Text, txtBuy_detail.Text, txtBuy_link.Text, txtBuy_price.Text, False)
        MultiView.ActiveViewIndex = 2
        success.Visible = False
        title_.Visible = False

    End Sub
End Class
