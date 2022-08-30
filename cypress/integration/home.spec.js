describe('home page', () => {
  it('should display the home page', () => {
    cy.visit('/');

    cy.contains("Jungle");
  });

  it("There is a product on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});