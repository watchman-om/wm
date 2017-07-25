package com.onnurimotors.wm.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.onnurimotors.wm.model.EMPLOYEE;

@Service
public class PushService {
	public final static String FCM_URL = "https://fcm.googleapis.com/fcm/send";
	public final static String SERVER_KEY = "AAAApU0c0CE:APA91bFLoDy5_4P07Uov149_BOizpkBqqghyv1f8Okg4mYqjVGn8CTQu1K4-byXNLlT-KuXoeXk62aR72n7VA8WsHpBxPHiKERdHtFwLaKFD1-OmlInyUwvdsCEip4Zra6YQF55Q-OE9";

	
	public void sendAll(String message, String title, List<EMPLOYEE> emps) {
		System.out.println("receiver List : " + emps.size());
		for(EMPLOYEE e : emps) {
			sendPush(e.getKAKAO_ACCOUNT(), title, message);
		}
	}
	static void sendPush(String tokenId, String title, String message){
		try{

			// Create URL instance.
			URL url = new URL(FCM_URL);

			// create connection.
			HttpURLConnection conn;
			conn = (HttpURLConnection) url.openConnection();

			conn.setUseCaches(false);
			conn.setDoInput(true);
			conn.setDoOutput(true);

			//set method as POST or GET
			conn.setRequestMethod("POST");

			//pass FCM server key
			conn.setRequestProperty("Authorization","key="+SERVER_KEY);

			//Specify Message Format
			conn.setRequestProperty("Content-Type","application/json");

			//Create JSON Object & pass value
			JSONObject infoJson = new JSONObject();
			infoJson.put("title", title);
			infoJson.put("keyname", message);

			JSONObject json = new JSONObject();
			json.put("to",tokenId.trim());
			json.put("data", infoJson);

			OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
			wr.write(json.toString());
			wr.flush();

			int status = 0;
			if( null != conn ){
				status = conn.getResponseCode();
			}

			if( status != 0){
				if( status == 200 ){
					//SUCCESS message
					BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					System.out.println("Android Notification Response : " + reader.readLine());

				}else if(status == 401){
					//client side error
					System.out.println("Notification Response : TokenId : " + tokenId + " Error occurred :");

				}else if(status == 501){
					//server side error
					System.out.println("Notification Response : [ errorCode=ServerError ] TokenId : " + tokenId);

				}else if( status == 503){
					//server side error
					System.out.println("Notification Response : FCM Service is Unavailable  TokenId : " + tokenId);

				}
			}
		}catch(MalformedURLException mlfexception){
			// Prototcal Error
			System.out.println("Error occurred while sending push Notification!.." + mlfexception.getMessage());

		}catch(IOException mlfexception){
			//URL problem
			System.out.println("Reading URL, Error occurred while sending push Notification!.." + mlfexception.getMessage());

		}catch(JSONException jsonexception){
			//Message format error
			System.out.println("Message Format, Error occurred while sending push Notification!.." + jsonexception.getMessage());

		}catch (Exception exception) {
			//General Error or exception.
			System.out.println("Error occurred while sending push Notification!.." + exception.getMessage());

		}

	}
	static void sendPushNotification(String tokenId, String title, String message){
		try{

			// Create URL instance.
			URL url = new URL(FCM_URL);

			// create connection.
			HttpURLConnection conn;
			conn = (HttpURLConnection) url.openConnection();

			conn.setUseCaches(false);
			conn.setDoInput(true);
			conn.setDoOutput(true);

			//set method as POST or GET
			conn.setRequestMethod("POST");

			//pass FCM server key
			conn.setRequestProperty("Authorization","key="+SERVER_KEY);

			//Specify Message Format
			conn.setRequestProperty("Content-Type","application/json");

			//Create JSON Object & pass value
			JSONObject infoJson = new JSONObject();
			infoJson.put("title", title);
			infoJson.put("body", message);

			JSONObject json = new JSONObject();
			json.put("to",tokenId.trim());
			json.put("notification", infoJson);

			OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
			wr.write(json.toString());
			wr.flush();

			int status = 0;
			if( null != conn ){
				status = conn.getResponseCode();
			}

			if( status != 0){
				if( status == 200 ){
					//SUCCESS message
					BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					System.out.println("Android Notification Response : " + reader.readLine());

				}else if(status == 401){
					//client side error
					System.out.println("Notification Response : TokenId : " + tokenId + " Error occurred :");

				}else if(status == 501){
					//server side error
					System.out.println("Notification Response : [ errorCode=ServerError ] TokenId : " + tokenId);

				}else if( status == 503){
					//server side error
					System.out.println("Notification Response : FCM Service is Unavailable  TokenId : " + tokenId);

				}
			}
		}catch(MalformedURLException mlfexception){
			// Prototcal Error
			System.out.println("Error occurred while sending push Notification!.." + mlfexception.getMessage());

		}catch(IOException mlfexception){
			//URL problem
			System.out.println("Reading URL, Error occurred while sending push Notification!.." + mlfexception.getMessage());

		}catch(JSONException jsonexception){
			//Message format error
			System.out.println("Message Format, Error occurred while sending push Notification!.." + jsonexception.getMessage());

		}catch (Exception exception) {
			//General Error or exception.
			System.out.println("Error occurred while sending push Notification!.." + exception.getMessage());

		}

	}
	
	public static void main(String[] args) {

		//Just I am passed dummy information

		String tokenId = "cfndQvCA6WM:APA91bHQZCpr-OJSPnF56IFUsYv5vS55lbxNIlwWdQy40w6bGEfwU2UrUd7h09zVvMnH24sEKB6mCFr9Ek4KfaiyQj87Xn4Qz5YxGwZEKZYvVtULjusEb3Yv6nKYBTk5HUyg6HKi9eyO";

		String title = "Title";

		String message = "Welcome to FCM Server push notification!.";

		//Method to send Push Notification

		sendPush(tokenId, title, message);

	}

}
