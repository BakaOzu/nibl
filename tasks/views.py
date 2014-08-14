from rest_framework import generics
from models import Task, Tag
from serializers import TaskSerializer, TagSerializer
from django.shortcuts import render
from rest_framework import viewsets
# from rest_framework.decorators import link


def home(request):
    return render(request, 'home.html')

class TagList(generics.ListCreateAPIView):
    model = Tag
    serializer_class = TagSerializer


class TagDetail(generics.RetrieveUpdateDestroyAPIView):
    model = Tag
    serializer_class = TagSerializer
    lookup_field = 'name'


class TaskViewSet(viewsets.ModelViewSet):
    queryset = Task.objects.all()
    serializer_class = TaskSerializer

    def pre_save(self, obj):
        obj.owner = self.request.user
