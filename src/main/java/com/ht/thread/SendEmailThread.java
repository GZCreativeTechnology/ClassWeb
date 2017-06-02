package com.ht.thread;

import com.ht.common.Constants;
import com.jh.email.Mail;
import com.jh.email.MailSender;

import java.util.List;

/**
 * Created by Administrator on 2017-05-04. 发送邮件的线程
 */
public class SendEmailThread implements Runnable {

    private List<Mail> mails;

    public SendEmailThread(List<Mail> mails) {
        this.mails = mails;
    }

    @Override
    public void run() {
        for (Mail mail : mails) {
            MailSender mailSender = new MailSender();
            mailSender.sendEmailByType(Constants.MAIL_TYPE, mail, Constants.MAIL_SENDER, Constants.MAIL_PASSWORD);
        }

    }
}
