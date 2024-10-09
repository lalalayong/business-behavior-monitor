package com.jcg.monitor.sdk.push;


import com.jcg.monitor.sdk.model.LogMessage;

/**
 * @description 发布
 */
public interface IPush {

    void open(String host, int port);

    void send(LogMessage logMessage);

}
