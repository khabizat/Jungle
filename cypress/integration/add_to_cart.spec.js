/// <reference types="cypress" />

describe('add to cart', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  });

  it("Users can click the 'Add to Cart' button for a product on the home page and in doing so their cart increases by one", () => {
    cy.get(".btn").first().should("be.visible").click({force: true});
    cy.get('.end-0').should('include.text', 'My Cart (1)');
  });
});