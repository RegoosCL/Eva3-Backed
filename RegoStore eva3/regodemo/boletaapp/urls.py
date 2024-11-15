from django.urls import path
from . import views

urlpatterns = [
    path('mis-boletas/', views.lista_boletas, name='lista_boletas'),
    path('boleta/<int:boleta_id>/', views.detalle_boleta, name='detalle_boleta'),
]