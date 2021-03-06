# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting model 'Project'
        db.delete_table(u'tasks_project')

        # Deleting field 'Task.project'
        db.delete_column(u'tasks_task', 'project_id')

        # Deleting field 'Task.type'
        db.delete_column(u'tasks_task', 'type')

        # Adding field 'Task.priority'
        db.add_column(u'tasks_task', 'priority',
                      self.gf('django.db.models.fields.IntegerField')(default=1),
                      keep_default=False)

        # Adding field 'Task.daysAvailable'
        db.add_column(u'tasks_task', 'daysAvailable',
                      self.gf('django.db.models.fields.BinaryField')(null=True),
                      keep_default=False)

        # Adding field 'Task.next_date'
        db.add_column(u'tasks_task', 'next_date',
                      self.gf('django.db.models.fields.DateField')(null=True),
                      keep_default=False)

        # Removing M2M table for field tag on 'Task'
        db.delete_table(db.shorten_name(u'tasks_task_tag'))

        # Adding M2M table for field tags on 'Task'
        m2m_table_name = db.shorten_name(u'tasks_task_tags')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('task', models.ForeignKey(orm[u'tasks.task'], null=False)),
            ('tag', models.ForeignKey(orm[u'tasks.tag'], null=False))
        ))
        db.create_unique(m2m_table_name, ['task_id', 'tag_id'])


    def backwards(self, orm):
        # Adding model 'Project'
        db.create_table(u'tasks_project', (
            ('owner', self.gf('django.db.models.fields.related.ForeignKey')(related_name='projects', to=orm['auth.User'])),
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal(u'tasks', ['Project'])


        # User chose to not deal with backwards NULL issues for 'Task.project'
        raise RuntimeError("Cannot reverse this migration. 'Task.project' and its values cannot be restored.")
        
        # The following code is provided here to aid in writing a correct migration        # Adding field 'Task.project'
        db.add_column(u'tasks_task', 'project',
                      self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tasks.Project']),
                      keep_default=False)

        # Adding field 'Task.type'
        db.add_column(u'tasks_task', 'type',
                      self.gf('django.db.models.fields.CharField')(default='pomodoro', max_length=10),
                      keep_default=False)

        # Deleting field 'Task.priority'
        db.delete_column(u'tasks_task', 'priority')

        # Deleting field 'Task.daysAvailable'
        db.delete_column(u'tasks_task', 'daysAvailable')

        # Deleting field 'Task.next_date'
        db.delete_column(u'tasks_task', 'next_date')

        # Adding M2M table for field tag on 'Task'
        m2m_table_name = db.shorten_name(u'tasks_task_tag')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('task', models.ForeignKey(orm[u'tasks.task'], null=False)),
            ('tag', models.ForeignKey(orm[u'tasks.tag'], null=False))
        ))
        db.create_unique(m2m_table_name, ['task_id', 'tag_id'])

        # Removing M2M table for field tags on 'Task'
        db.delete_table(db.shorten_name(u'tasks_task_tags'))


    models = {
        u'auth.group': {
            'Meta': {'object_name': 'Group'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        u'auth.permission': {
            'Meta': {'ordering': "(u'content_type__app_label', u'content_type__model', u'codename')", 'unique_together': "((u'content_type', u'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['contenttypes.ContentType']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Group']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Permission']"}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        u'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'tasks.tag': {
            'Meta': {'object_name': 'Tag'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        u'tasks.task': {
            'Meta': {'object_name': 'Task'},
            'availability_type': ('django.db.models.fields.CharField', [], {'default': "'always'", 'max_length': '10'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'daysAvailable': ('django.db.models.fields.BinaryField', [], {'null': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '100'}),
            'next_date': ('django.db.models.fields.DateField', [], {'null': 'True'}),
            'owner': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'tasks'", 'to': u"orm['auth.User']"}),
            'pomodoro_all': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'pomodoro_completed': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'priority': ('django.db.models.fields.IntegerField', [], {}),
            'tags': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['tasks.Tag']", 'symmetrical': 'False'})
        }
    }

    complete_apps = ['tasks']