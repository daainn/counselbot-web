# dogs/urls.py
from django.urls import path
from . import views

app_name = 'dogs'

urlpatterns = [
    path('dog_info/join/', views.dog_info_join_view, name='dog_info_join'),
    path('dog_info_submit', views.dog_info_submit, name='dog_info_submit'),
]

