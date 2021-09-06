$(document).ready(function(){displayCart()}) //Fires displayCart() when DOM is loaded


//Removes all Local Storage as a way to delete the cart
function deleteCart(){
	localStorage.clear()
	location.reload();
}






//Function is created to show the user that the something has been added to the cart. This can be improved by having a dropdown that only shows instead in css

function cartBuy(){
	alert('Items Purchased, Thank you!');
}
	

//Array of items that are imported

this.products=
	[
  { "image": "Assets/mens1.jpg", "name": "Everest Bomber Jacket", "price": 11999 },
  { "image": "Assets/mens2.jpg", "name": "Vintage Logo Hoodie", "price": 4999 },
  { "image": "Assets/mens3.jpg", "name": "Everest Bomber Jacket Black", "price": 11999 },
  { "image": "Assets/mens4.jpg", "name": "Premium Goods Tri Infill Hoodie", "price": 4999 },
  { "image": "Assets/mens5.jpg", "name": "California Hoodie", "price": 5599 },
  { "image": "Assets/mens6.jpg", "name": "Retro Stripe Sweatshirt", "price": 4999 },
  { "image": "Assets/mens7.jpg", "name": "Real Logo 1st Hoodie", "price": 4999 },
  { "image": "Assets/mens8.jpg", "name": "Split Track Oversized Sweatshirt", "price": 5499 },
  { "image": "Assets/mens9.jpg", "name": "Mega Logo Crew Neck Jumper", "price": 5999 },
  { "images":"Assets/womens1.jpg","name": "Blair Crew Sweatshirt", "price": 4999},	
  { "images":"Assets/womens2.jpg","name": "Rylee Leather Biker Jacket", "price": 14999},		
  { "images":"Assets/womens3.jpg","name": "Contak Down Stretch Jacket", "price": 10999},	
  { "images":"Assets/womens4.jpg","name": "Croyde Cable Knit", "price": 4499},	
  { "images":"Assets/womens5.jpg","name": "Atlas Padded Jacket", "price": 9999},	
  { "images":"Assets/womens6.jpg","name": "Blair Crew Sweatshirt", "price": 4999},	
  { "images":"Assets/womens7.jpg","name": "Lightweight Seersucker Shirt", "price": 3999},	
  { "images":"Assets/womens8.jpg","name": "Breton Twist Back Top", "price": 2499},	
  { "images":"Assets/womens9.jpg","name": "Vintage Logo Pastel Deboss Hoodie", "price": 4499},	
  { "images":"Assets/newin1.jpg","name": "Training Zip Hoodie", "price": 3599},			
  { "images":"Assets/newin2.jpg","name": "Japan Breakers Utility Jacket", "price": 9799},		
  { "images":"Assets/newin3.jpg","name": "Oxygen Zip Hoodie", "price": 6999},		
  { "images":"Assets/newin4.jpg","name": "Sport Windsprinter", "price": 6999},		
  { "images":"Assets/newin5.jpg","name": "Gym Tech Stretch Joggers", "price": 5999},		
  { "images":"Assets/newin6.jpg","name":"Core Loose Vest Top", "price": 2499},		
  { "images":"Assets/newin7.jpg","name": "Athletico Crop Crew Sweatshirt", "price": 5499},		
  { "images":"Assets/newin8.jpg","name": "Active Mesh Panel Leggings", "price": 4499},		
  { "images":"Assets/newin9.jpg","name": "Performance Insulate Leggings", "price": 4899},
 
	
]


//function that adds to the cart
function addProductToCart(index){
    var cart = getCart()
	
	var product
	
	for(i = 0; i < cart.length; i++){
		if(cart[i].index == index){
			product = cart[i]
			break
		}
		
	}
	
	if(product == undefined){ //checks to see if the product has been already added
		product = this.products[index]
		product.index = index
		product.quantity = 1
		cart.push(product) //Add the product to the cart if it hasn't already been added
	} else{
			
		product.quantity += 1 //else adds the quantity to the cart instead
	}
	
	
	alert(this.products[index].name + " selected!") //alerts the user that the item has been added
    setCart(cart)
	
}

function getCart() {
  var cartJSON = localStorage.getItem('cart') //Trying to load from local storage
  try {
    var cart = JSON.parse(cartJSON) //Converting from JSON to javascript object(s)
  } catch {}
  if(!cart) { cart = [] } //If cart is null, set cart to be an empty array
  return cart
}

//This function creates an empty cart, ready for use

function setCart(cart) {
  	var cartJSON = JSON.stringify(cart)
  localStorage.setItem('cart', cartJSON)
  displayCart();
}



function displayCart() {
    //Get the cart
    var cart = getCart()

    //Figure out the total of the cart
    var i;
    var total = 0;
    for(i = 0; i < cart.length; i++) {
        total += cart[i].price * cart[i].quantity;
    }

    //Display the cart clearly
	var cartPrice = document.getElementById("cart-price") 
	if(cartPrice !=null){
		
    	cartPrice.innerHTML = "£" + (total/100).toFixed(2);
		
	}
    //Unless we have a cart-items element, we're done here
    var cartItems = document.getElementById("cart-items")
    if (!cartItems) { return }

    //If we do though, display all the products one by one
    cartItems.innerHTML = ""
	var onClick= ""
	var text= ""
	var button= ""
    for(i = 0; i < cart.length; i++) {
		
		//Displaying the carts, creating three main vars(onClick, text, button). Bottom line it displaying text and button in a clear way
		onClick = "removeProductFromCart(" + cart[i].index + ")"
		text = cart[i].quantity + " x " + cart[i].name + ": £" + (cart[i].price * cart[i].quantity / 100).toFixed(2)
		button = "<button class=\"removeQuantity\" onclick=\"" + onClick + "\">Remove One</button>"
		cartItems.innerHTML += "<li>" + text + button + "</li>"
    }
}			

//Function to remove product from cart
function removeProductFromCart(index) {
    var cart = getCart() //Get the cart

    var product
    for(i = 0; i < cart.length; i++) {
        if (cart[i].index == index) {
            product = cart[i]
            productIndex = i
            break
        }
    }

    if (product == undefined) { return } 

	//If the quantity is more than 1, the function will remove one of the quantity. Else it will splice it instead and remove the entire product from the cart
    if (product.quantity > 1) {
        product.quantity -= 1
    } else {
        cart.splice(i, 1);
    }
//displays cart
    setCart(cart)
}















