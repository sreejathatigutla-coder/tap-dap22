package com.Job Creation Setup_01.runner;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(features="src/test/resources/com/Job Creation Setup_01/features",
				 glue={"com/Job Creation Setup_01/stepdefinitions","com/Job Creation Setup_01/hook"},
				 publish=true,
				 plugin={"pretty","html:target/CucumberReports/CucumberReport.html"})
public class TestRunner {
	
	

}
