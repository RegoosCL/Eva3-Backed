"""
URL configuration for regodemo project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from regoapp import views

urlpatterns = [
    path('', views.home, name='home'),
    path('about/', views.about, name='about'),
    path('products/', views.products, name='products'),
    path('contact/', views.contact, name='contact'),
    path('login/', views.user_login, name='login'),
    path('logout/', views.user_logout, name='user_logout'),
    path('register/', views.register, name='register'),
    path('carrito/', views.carrito, name='carrito'),
    path('add_to_cart/<int:product_id>/', views.add_to_cart, name='add_to_cart'),
    path('eliminar_del_carrito/<int:producto_id>/', views.eliminar_del_carrito, name='eliminar_del_carrito'),
    path('comprar/<int:producto>/', views.comprar, name='comprar'),
    path('modificar_usuario/', views.modificar_usuario, name='modificar_usuario'),
    path('perfil_usuario/', views.perfil_usuario, name='perfil_usuario'),
    path('eliminar_usuario/', views.eliminar_usuario, name='eliminar_usuario'),
    path('admin_panel/', views.admin_panel, name='admin_panel'),
    path('loginadmin/', views.loginadmin, name='loginadmin')

]
