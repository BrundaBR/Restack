from django.shortcuts import render
from rest_framework import generics
# Create your views here.
from .models import Signup,Post
from django.views.generic.detail import DetailView

from .serializers import SignupSerializer,PostSerializer


class SignupView(generics.ListCreateAPIView):
    queryset=Signup.objects.all()
    serializer_class=SignupSerializer

class PostView(generics.ListCreateAPIView):
    queryset=Post.objects.all()
    serializer_class=PostSerializer
