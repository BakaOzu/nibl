from django.db import models



class Tag(models.Model):
    name = models.CharField(max_length=20, unique=True)

    def __unicode__(self):
        return u'%s' % (self.name)
  

class Task(models.Model):
    name = models.CharField(max_length=100 , unique=True)
    owner = models.ForeignKey('auth.User', related_name='tasks')
    created = models.DateTimeField(auto_now_add=True)
    priority = models.IntegerField(default=1) #should have a check on min/max
    daysAvailable = models.BinaryField(null=True)
    next_date = models.DateField(null=True)
    # tags = models.ManyToManyField(Tag)
    pomodoro_all = models.IntegerField(default=0)
    pomodoro_completed = models.IntegerField(default=0)
    
    availability_types = (
        ('always', 'always'),
        ('repeated', 'repeated'),
        ('once', 'once')
    )    
    availability_type = models.CharField(max_length=10, choices=availability_types, default='always')

    def __unicode__(self):
        return u'%s' % (self.name)

    # def save(self):








