from rest_framework import serializers
from .models import Signup,Post

class SignupSerializer(serializers.ModelSerializer):
    class Meta:
        model=Signup
        fields=(
            'email',
            'username',
            'password',
        )
class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model=Post
        fields = '__all__'