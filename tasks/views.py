from rest_framework import viewsets, generics
from rest_framework.views import APIView
from rest_framework.response import Response
from models import Task, Tag
from serializers import TaskSerializer, TagSerializer
from django.shortcuts import render
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


# class TaskGetLast(APIView):

#     def get(self, request):
#         tasks = Task.objects.order_by('-pk')[0]
#         serializer = TaskSerializer(tasks)
#         return Response(serializer.data)

#     # def pre_save(self, obj):
#     #     obj.owner = self.request.user

