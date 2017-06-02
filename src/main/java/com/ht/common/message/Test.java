package com.ht.common.message;

import com.ht.common.Constants;
import com.jh.email.Mail;
import com.jh.email.MailSender;

import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;

public class Test
{

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		// 获取开发者账号信息
		// AccountInfo.execute();

		// 验证码通知短信接口
		//IndustrySMS.execute();

		// 会员营销短信接口
		// AffMarkSMS.execute();

		// 短信邮验证码通知短信接口
		// IndustryEmailSMS.execute();

		// 短信邮验证码通知短信接口
		// AffMarkEmailSMS.execute();

		// 语音验证码
		// VoiceCode.execute();
		String to = "15079767839,18279700225,15570102341";
		String code = "123214";
		String smsContent = "【创意科技】您的验证码为"+code+"，请于30分钟内正确输入，如非本人操作，请忽略此短信。";
		IndustrySMS is = new IndustrySMS(to, smsContent);
		is.execute();
	/*	Mail mail = new Mail();
		mail.setRecipients("2364551314@qq.com");
		mail.setSubject("通知");
		mail.setType(Mail.HTML);
		Multipart multipart = new MimeMultipart();
		BodyPart part1 = new MimeBodyPart();
		try {
			part1.setContent("<p>邮箱测</p>", mail.getType());
			multipart.addBodyPart(part1);
			mail.setMultipart(multipart);
		} catch (MessagingException e) {
		}
		MailSender mailSender = new MailSender();
		mailSender.sendEmailByType(Constants.MAIL_TYPE, mail, Constants.MAIL_SENDER, Constants.MAIL_PASSWORD);
*/
	}
}
