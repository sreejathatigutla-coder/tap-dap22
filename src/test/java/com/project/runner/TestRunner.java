package com.project.runner;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(features="src/test/resources/com/project/features",
				 glue={"com/project/stepdefinitions","com/project/hook"},
				 publish=true,
				 plugin={"pretty", "html:target/CucumberReports/CucumberReport.html", "html:target/cucumber-reports/cucumber.html", "json:target/cucumber-reports/cucumber.json", "junit:target/cucumber-reports/cucumber.xml", "com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:"})
public class TestRunner {
	
	

}
