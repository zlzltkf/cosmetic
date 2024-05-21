package com.example.cosmetic.controller.order;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;
import java.util.stream.Collectors;

import javax.net.ssl.HttpsURLConnection;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class Refund {
    public static void refundRequest(String access_token, String merchant_uid, String reason) throws IOException {
        URL url = new URL("https://api.iamport.kr/payments/cancel");
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
 
        // 요청 방식을 POST로 설정
        conn.setRequestMethod("GET");
 
        // 요청의 Content-Type, Accept, Authorization 헤더 설정
        conn.setRequestProperty("Content-type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestProperty("Authorization", access_token);
 
        // 해당 연결을 출력 스트림(요청)으로 사용
        conn.setDoOutput(true);
 
        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
        JsonObject json = new JsonObject();
        json.addProperty("merchant_uid", merchant_uid);
        json.addProperty("reason", reason);
 
        // 출력 스트림으로 해당 conn에 요청
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString());
        bw.flush();
        bw.close();
 
        // 입력 스트림으로 conn 요청에 대한 응답 반환
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        br.close();
        conn.disconnect();
 
        System.out.println("결제 취소 완료 : 주문 번호 {}"+ merchant_uid);
        
     // HTTP 응답 코드 확인
        int responseCode = conn.getResponseCode();
        System.out.println("Response Code: " + responseCode);
        
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
            String responseJson = reader.lines().collect(Collectors.joining("\n"));
            System.out.println("응답 본문: " + responseJson);

            JsonObject jsonResponse = JsonParser.parseString(responseJson).getAsJsonObject();
            String resultCode = jsonResponse.get("code").getAsString();
            String resultMessage = jsonResponse.get("message").getAsString();

            System.out.println("결과 코드 = " + resultCode);
            System.out.println("결과 메시지 = " + resultMessage);
        } catch (IOException e) {
            // 예외 처리
        }
    }
	
	
    public static String getToken(String apiKey, String secretKey) throws IOException {
        URL url = new URL("https://api.iamport.kr/users/getToken");
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
 
        // 요청 방식을 POST로 설정
        conn.setRequestMethod("POST");
 
        // 요청의 Content-Type과 Accept 헤더 설정
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
 
        // 해당 연결을 출력 스트림(요청)으로 사용
        conn.setDoOutput(true);
 
        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
        JsonObject json = new JsonObject();
        json.addProperty("imp_key", apiKey);
        json.addProperty("imp_secret", secretKey);
 
        // 출력 스트림으로 해당 conn에 요청
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString()); // json 객체를 문자열 형태로 HTTP 요청 본문에 추가
        bw.flush(); // BufferedWriter 비우기
        bw.close(); // BufferedWriter 종료
 
        // 입력 스트림으로 conn 요청에 대한 응답 반환
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        
        Gson gson = new Gson(); // 응답 데이터를 자바 객체로 변환
        String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
        String accessToken = gson.fromJson(response, Map.class).get("access_token").toString();
        br.close(); // BufferedReader 종료
 
        conn.disconnect(); // 연결 종료
 
        System.out.println("Iamport 엑세스 토큰 발급 성공 : {}"+ accessToken);
        
        return accessToken;
    }
}
