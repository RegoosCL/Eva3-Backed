from django.contrib import admin
from regoapp.models import Contact, Product, Carrito
from boletaapp.models import Boleta, DetalleBoleta

admin.site.register(Product)

admin.site.register(Contact)

admin.site.register(Carrito)

admin.site.register(Boleta)

admin.site.register(DetalleBoleta)


# Register your models here.
