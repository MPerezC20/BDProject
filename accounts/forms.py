from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from .models import CustomUser

class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = CustomUser
        fields = ('username', 'email', 'phone', 'password1', 'password2')

class CustomAuthenticationForm(AuthenticationForm):
    pass
