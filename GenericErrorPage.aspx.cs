﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using HanaMicron.COMS.Model;
using HanaMicron.COMS.BLL;
using System.Text;
using System.Net.Mime;

public partial class GenericErrorPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		// 메세지를 만든다.
		MailMessage mail = new MailMessage();
		
		// 보내는 사람 이름 주소 표시
		mail.From = new MailAddress("house@hanamicron.co.kr", "COMS System");

		// 받는 사람 이름 주소 표시
		mail.To.Add(new MailAddress("house@hanamicron.co.kr","김준용"));

		// 받는 사람 계속 추가 가능
		//mail.To.Add(new MailAddress("house@hanamicron.co.kr", "김준용"));

		// 참조 추가 가능
		//mail.CC.Add(new MailAddress("house@hanamicron.co.kr", "김준용"));

		// 제목
		mail.Subject = "Coms System Error Message";

		// 내용
		mail.Body = "Event Time = " + DateTime.Now + "<br />"; 
		mail.Body += "Path = " + Request["aspxerrorpath"] + "<br />";
		mail.Body += "User IP = " + Request.UserHostAddress + "<br />"; ;
		mail.Body += "Cookie saveID = " + Request.Cookies["saveID"].Value + "<br />"; ;

		//  로그인한 사용자 정보
		EmployeeInfo loginEmployee = new EmployeeInfo();
		loginEmployee = (EmployeeInfo)Session["loginMember"];
		if (loginEmployee != null)
		{
			mail.Body += "session User ID = " + loginEmployee.Upnid + "<br />"; ;
			mail.Body += "session User Name = " + loginEmployee.DisplayName + "<br />"; ;
		}

		mail.BodyEncoding = System.Text.Encoding.UTF8;

		// html 여부
		mail.IsBodyHtml = true;

		// 메일 우선 순위를 높게 책정
		mail.Priority = MailPriority.High;

		// 첨부 파일
		//mail.Attachments.Add(new Attachment(@"c:\demo.zip", MediaTypeNames.Application.Octet));
		//mail.Attachments.Add(new Attachment(@"c:\readme.txt", MediaTypeNames.Application.Octet));

		SmtpClient smtpClient = new SmtpClient();
		smtpClient.Send(mail);
    }
}
