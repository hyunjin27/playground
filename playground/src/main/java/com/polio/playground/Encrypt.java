package com.polio.playground;

import java.security.*;

public class Encrypt {

	public Encrypt() {
	}
	
	public String toMD5(String str){
		String MD5 = ""; 
		try{
			// AES 나 TKIP 같은 방법으로도 인코딩 가능하나, 서버의 한계로 MD5로 진행.
			MessageDigest md = MessageDigest.getInstance("MD5"); 
			md.update(str.getBytes()); 
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			MD5 = sb.toString();
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			MD5 = null; 
		}
		return MD5;
	}

}
