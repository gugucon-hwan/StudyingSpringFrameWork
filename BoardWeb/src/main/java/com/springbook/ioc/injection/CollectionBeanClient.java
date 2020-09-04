package com.springbook.ioc.injection;

import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;



public class CollectionBeanClient {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AbstractApplicationContext factory=
				new GenericXmlApplicationContext("applicationContext.xml");
		
		CollectionBean bean=(CollectionBean) factory.getBean("collectionBean");
		Properties addressList=bean.getAddressList();
		
		for(Object address : addressList.keySet()) {			
			System.out.println(address+" : "+addressList.getProperty((String)address));
		}
		factory.close();
	}

}
