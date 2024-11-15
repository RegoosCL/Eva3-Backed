from django.db import models
from django.contrib.auth.models import User
from regoapp.models import Product

class Boleta(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    fecha_compra = models.DateTimeField(auto_now_add=True)
    subtotal = models.DecimalField(max_digits=10, decimal_places=2)
    iva = models.DecimalField(max_digits=10, decimal_places=2)
    total = models.DecimalField(max_digits=10, decimal_places=2)

    def save(self, *args, **kwargs):
        if not self.iva:
            self.iva = self.subtotal * 0.19  
        if not self.total:
            self.total = self.subtotal + self.iva
        super().save(*args, **kwargs)

    def __str__(self):
        return f"Boleta #{self.id} - {self.usuario.username}"

class DetalleBoleta(models.Model):
    boleta = models.ForeignKey(Boleta, related_name='detalles', on_delete=models.CASCADE)
    producto = models.ForeignKey(Product, on_delete=models.PROTECT)
    cantidad = models.IntegerField()
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)
    subtotal = models.DecimalField(max_digits=10, decimal_places=2)

    def save(self, *args, **kwargs):
        self.subtotal = self.cantidad * self.precio_unitario
        super().save(*args, **kwargs)

    def __str__(self):
        return f"Detalle de Boleta #{self.boleta.id} - {self.producto.name}"
    
# Create your models here.
