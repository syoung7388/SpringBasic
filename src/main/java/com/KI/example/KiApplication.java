package com.KI.example;
import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class KiApplication {

	public static void main(String[] args) {
		SpringApplication.run(KiApplication.class, args);
		System.out.print("Hello");
	}

}
