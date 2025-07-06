from django import forms
from django.contrib.auth.forms import UserChangeForm, UserCreationForm, AuthenticationForm
from .models import CustomUser

class CustomUserChangeForm(UserChangeForm):
    password = None  # Oculta el campo de contraseña

    class Meta:
        model = CustomUser
        fields = ('username', 'email', 'phone')  # Campos editables

class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = CustomUser
        fields = ('username', 'email', 'phone', 'password1', 'password2')

class CustomAuthenticationForm(AuthenticationForm):
    pass
