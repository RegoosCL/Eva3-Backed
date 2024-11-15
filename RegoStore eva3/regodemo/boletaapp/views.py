from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Boleta

@login_required
def lista_boletas(request):
    boletas = Boleta.objects.filter(usuario=request.user).order_by('-fecha_compra')
    return render(request, 'boletaapp/lista_boletas.html', {'boletas': boletas})

@login_required
def detalle_boleta(request, boleta_id):
    boleta = get_object_or_404(Boleta, id=boleta_id, usuario=request.user)
    return render(request, 'boletaapp/detalle_boleta.html', {'boleta': boleta})

# Create your views here.
