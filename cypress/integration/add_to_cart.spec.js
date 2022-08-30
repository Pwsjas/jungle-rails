describe('add to cart', () => {
  it('should display the home page', () => {
    cy.visit('/');

    cy.contains("Jungle");
  });

  it("should contain a product on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should contain 0 items in the cart", () => {
    cy.get(".fa-shopping-cart").parent()
    .contains("My Cart (0)");
  });

  it("should update to 1 item in the cart when clicking add (to cart)", () => {
    //Click the add button
    cy.get(".button_to").children().contains('Add').first().click({force:true});
  
    //Check MyCart updated to 1
    cy.get(".fa-shopping-cart").parent()
    .contains("My Cart (1)");
  });
});