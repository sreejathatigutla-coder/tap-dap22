package com.tap-dap22.stepdefinitions;

import com..utils.ElementUtils;
import org.junit.Assert;
import com.tap-dap22.driverfactory.DriverFactory;
import com.tap-dap22.pages.OpenCreateNewJobOpeningForPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
public class OpenCreateNewJobOpeningFor extends DriverFactory {
OpenCreateNewJobOpeningForPage jobOpeningPage = new OpenCreateNewJobOpeningForPage(driver);
@Given("the user is on the Job Opening screen")
public void the_user_is_on_the_job_opening_screen() {
jobOpeningPage.navigateToJobOpeningScreen();
}
@When("the user locates the Add Job Opening button")
public void the_user_locates_the_add_job_opening_button() {
jobOpeningPage.findAddJobOpeningButton();
}
@When("the user clicks on the Add Job Opening button")
public void the_user_clicks_on_the_add_job_opening_button() {
jobOpeningPage.clickAddJobOpeningButton();
}
@Then("the Create New Job Opening form is displayed")
public void the_create_new_job_opening_form_is_displayed() {
jobOpeningPage.isCreateNewJobOpeningFormDisplayed();
}
@And("the form contains fields for job title, description, requirements, and other relevant information")
public void the_form_contains_fields_for_job_title_description_requirements_and_other_relevant_information() {
jobOpeningPage.areFieldsPresent();
}
@And("the form displays Save and Cancel buttons")
public void the_form_displays_save_and_cancel_buttons() {
jobOpeningPage.areSaveAndCancelButtonsDisplayed();
}
@Given("the user fills in the job title field with {string}")
public void the_user_fills_in_the_job_title_field_with(String jobTitle) {
jobOpeningPage.fillJobTitleField(jobTitle);
}
@Given("the user fills in the job description field with {string}")
public void the_user_fills_in_the_job_description_field_with(String jobDescription) {
jobOpeningPage.fillJobDescriptionField(jobDescription);
}
@Given("the user fills in the job requirements field with {string}")
public void the_user_fills_in_the_job_requirements_field_with(String jobRequirements) {
jobOpeningPage.fillJobRequirementsField(jobRequirements);
}
@Given("all required fields are filled")
public void all_required_fields_are_filled() {
jobOpeningPage.fillAllRequiredFields();
}
@Then("the Save button is enabled")
public void the_save_button_is_enabled() {
jobOpeningPage.isSaveButtonEnabled();
}
@Then("the Cancel button remains enabled")
public void the_cancel_button_remains_enabled() {
jobOpeningPage.isCancelButtonEnabled();
}
@When("the user clicks on the Cancel button in the Create New Job Opening form")
public void the_user_clicks_on_the_cancel_button_in_the_create_new_job_opening_form() {
jobOpeningPage.clickCancelButton();
}
@Then("the Create New Job Opening form is closed")
public void the_create_new_job_opening_form_is_closed() {
jobOpeningPage.isCreateNewJobOpeningFormDisplayed();
}
@Then("the user is returned to the Job Opening screen")
public void the_user_is_returned_to_the_job_opening_screen() {
jobOpeningPage.isOnJobOpeningScreen();
}
@When("the user leaves the job title field empty")
public void the_user_leaves_the_job_title_field_empty() {
jobOpeningPage.leaveJobTitleFieldEmpty();
}
@When("the user leaves the job description field empty")
public void the_user_leaves_the_job_description_field_empty() {
jobOpeningPage.leaveJobDescriptionFieldEmpty();
}
@When("the user leaves the job requirements field empty")
public void the_user_leaves_the_job_requirements_field_empty() {
jobOpeningPage.leaveJobRequirementsFieldEmpty();
}
@When("the user clicks the Save button")
public void the_user_clicks_the_save_button() {
jobOpeningPage.clickSaveButton();
}
@Then("validation messages are displayed for the empty job title field")
public void validation_messages_are_displayed_for_the_empty_job_title_field() {
jobOpeningPage.isJobTitleValidationMessageDisplayed();
}
@Then("validation messages are displayed for the empty job description field")
public void validation_messages_are_displayed_for_the_empty_job_description_field() {
jobOpeningPage.isJobDescriptionValidationMessageDisplayed();
}
@Then("validation messages are displayed for the empty job requirements field")
public void validation_messages_are_displayed_for_the_empty_job_requirements_field() {
jobOpeningPage.isJobRequirementsValidationMessageDisplayed();
}
@Then("the Save button remains disabled")
public void the_save_button_remains_disabled() {
jobOpeningPage.isSaveButtonEnabled();
}
@When("I fill in the job title field with {string}")
public void i_fill_in_the_job_title_field_with(String jobTitle) {
jobOpeningPage.fillJobTitleField(jobTitle);
}
@When("I leave the job description field empty")
public void i_leave_the_job_description_field_empty() {
jobOpeningPage.leaveJobDescriptionFieldEmpty();
}
@When("I fill in the job requirements field with {string}")
public void i_fill_in_the_job_requirements_field_with(String jobRequirements) {
jobOpeningPage.fillJobRequirementsField(jobRequirements);
}
@Then("validation messages should be displayed for the empty job description field")
public void validation_messages_should_be_displayed_for_the_empty_job_description_field() {
jobOpeningPage.isJobDescriptionValidationMessageDisplayed();
}
@Then("the job title field should retain the value {string}")
public void the_job_title_field_should_retain_the_value(String jobTitle) {
Assert.assertEquals(jobTitle, jobOpeningPage.getJobTitleFieldValue());
}
@Then("the job requirements field should retain the value {string}")
public void the_job_requirements_field_should_retain_the_value(String jobRequirements) {
Assert.assertEquals(jobRequirements, jobOpeningPage.getJobRequirementsFieldValue());
}
@When("I enter the job title {string}")
public void i_enter_the_job_title(String jobTitle) {
jobOpeningPage.fillJobTitleField(jobTitle);
}
@When("I fill in the job description {string}")
public void i_fill_in_the_job_description(String jobDescription) {
jobOpeningPage.fillJobDescriptionField(jobDescription);
}
@When("I fill in the requirements {string}")
public void i_fill_in_the_requirements(String requirements) {
jobOpeningPage.fillJobRequirementsField(requirements);
}
@Then("the form saves successfully without any validation errors")
public void the_form_saves_successfully_without_any_validation_errors() {
jobOpeningPage.isSaveSuccessful();
}
@Then("the job opening is created with the special characters in the title")
public void the_job_opening_is_created_with_the_special_characters_in_the_title() {
jobOpeningPage.isJobOpeningCreatedWithSpecialCharacters();
}