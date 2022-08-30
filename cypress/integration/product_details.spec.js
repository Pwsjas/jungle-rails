describe('home page', () => {
  it('should display the home page', () => {
    cy.visit('/');

    cy.contains("Jungle");
  });

  it("should contain a product on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should be able to click on a product to navigate to a product's page", () => {
    cy.get(".products article").first().click();
    cy.get(".product-detail").should("be.visible");
    cy.get(".main-img").should("be.visible");
  });
});