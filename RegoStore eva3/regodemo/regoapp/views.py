from django.shortcuts import get_object_or_404, render, redirect
from django.contrib.auth import login, logout, authenticate
from .forms import UserRegisterForm, UserUpdateForm
from .models import Contact, Product, Carrito
from django.contrib import messages
from django.contrib.auth.decorators import login_required


def home(request):
    return render(request, 'home.html')

def about(request):
    return render(request, 'about.html')

@login_required
def modificar_usuario(request):
    if request.method == 'POST':
        form = UserUpdateForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            messages.success(request, 'Tu perfil ha sido actualizado con éxito.')
            return redirect('perfil_usuario')  # Redirige al perfil del usuario
    else:
        form = UserUpdateForm(instance=request.user)

    return render(request, 'modificar_usuario.html', {'form': form})

def perfil_usuario(request):
    return render(request, 'perfil_usuario.html')

@login_required
def eliminar_usuario(request):
    user = request.user
    user.delete()
    messages.success(request, 'Tu perfil ha sido eliminado con éxito.')
    return redirect('home')


def products(request):
    products = Product.objects.all()
    return render(request, 'products.html', {'products': products})

def contact(request):
    if request.method == 'POST':
        nombre = request.POST.get('name')
        email = request.POST.get('email')
        mensaje = request.POST.get('message')

        Contact.objects.create(nombre=nombre, email=email, mensaje=mensaje)
        
        messages.success(request, 'Mensaje enviado con éxito.')
        return redirect('contact')

    return render(request, 'contact.html')



def carrito(request):
    cart = request.session.get('cart', {})
    total_price = sum(item['price'] * item['quantity'] for item in cart.values())
    return render(request, 'carrito.html', {'cart': cart, 'total_price': total_price})

def add_to_cart(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    cart = request.session.get('cart', {})

    if str(product_id) in cart:
        cart[str(product_id)]['quantity'] += 1
    else:
        cart[str(product_id)] = {
            'name': product.name,
            'price': float(product.price),
            'quantity': 1
        }

    request.session['cart'] = cart
    request.session.modified = True
    return redirect('products')

def eliminar_del_carrito(request, producto_id):
    cart = request.session.get('cart', {})
    if str(producto_id) in cart:
        del cart[str(producto_id)]
        request.session.modified = True
    return redirect('carrito')



@login_required
def comprar(request, producto):
    cart = request.session.get('cart', {})
    producto_id = str(producto)

    if producto_id in cart:
        producto_obj = get_object_or_404(Product, id=producto)
        cantidad = cart[producto_id]['quantity']
        precio = cart[producto_id]['price']
        total = cantidad * precio

        # Crear el objeto Carrito en la base de datos
        Carrito.objects.create(
            producto=producto_obj,
            nombre_producto=producto_obj.name,  
            cantidad=cantidad,
            precio=precio,
            total=total
        )

        # Eliminar el producto del carrito
        del cart[producto_id]
        request.session.modified = True
        messages.success(request, 'Compra realizada con éxito.')
    else:
        messages.error(request, 'El producto no está en el carrito.')

    return redirect('carrito')



def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Usuario {username} creado con éxito.')
            return redirect('home')
    else:
        form = UserRegisterForm()
    return render(request, 'register.html', {'form': form})

def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.error(request, 'Nombre de usuario o contraseña no son validos')
    return render(request, 'login.html')


@login_required
def admin_panel(request):
    return render(request, 'admin.html')

def loginadmin(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            if user.is_superuser:
                return redirect('admin_panel') 
            else:
                messages.error(request, 'Nombre de usuario o contraseña no son válidos')
        else:
            messages.error(request, 'Nombre de usuario o contraseña no son válidos')
    return render(request, 'loginadmin.html')

@login_required
def user_logout(request):
    logout(request)
    return redirect('home')

# Create your views here.