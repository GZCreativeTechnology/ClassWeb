package com.ht.common.web;

import com.ht.common.Constants;

import javax.servlet.http.HttpSession;

/**
 * Created by WangGenshen on 5/19/16.
 */
public class SessionUtil {

    public static boolean isAdmin(HttpSession session) {
        return session.getAttribute(Constants.SESSION_ADMIN) != null;
    }

    public static boolean isUser(HttpSession session) {
        return session.getAttribute(Constants.SESSION_USER) != null;
    }
}
