/// <reference types="cypress" />

describe('from home page to product page', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://localhost:3000/')
  });

  it("User can navigate from the home page to the product detail page by clicking on a product", () => {
    cy.get(".products article").first().should("be.visible").click()
  });

});