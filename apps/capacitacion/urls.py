from django.urls import path
from .views import (CapacitacionCreateView, ListaCapacitacionView, CapacitacionUpdateView, ProyectoDescargaPdf,
                    EliminarCapacitacionView, ActaAsistenciaCreateView, VerActaAsistenciaView, GeneraCertificadoPdf,
                    BandejaValidacionView, ListaCapacitacionValidarView, ObservaCapacitacionView,
                    RevisarCapacitacionView, EliminarActaView, BandejaAsignarFirmanteView, ListaFirmanteAmbitoView,
                    AsignarFirmanteView, EliminarResponsableFirmanteView, GenerarMultipleCertificadosPdfView,
                    VerActaAsistenciaModalView, EnvioCertificadoMultiCorreo, EnvioCertificadoCorreo,
                    EnviaParaRevisionView, GeneraCertificadoPdfPorModulo, EnvioCertificadoPorModuloCorreo,
                    GenerarMultipleCertificadosPorModPdfView, EnvioCertificadoMultiCorreoMod)

app_name = 'capacitacion'

urlpatterns = [
    path('capacitacion', CapacitacionCreateView.as_view(), name='crear_capacitacion'),
    path('listar-capacitacion', ListaCapacitacionView.as_view(), name='listar_capacitacion'),
    path('editar/<str:pk>/', CapacitacionUpdateView.as_view(), name='editar'),
    path('proyecto-descarga-pdf/<str:archivo>', ProyectoDescargaPdf.as_view(), name='proyecto_descarga_pdf'),
    path('certificado-descarga-pdf/<int:id_capacitacion>/participante/<int:id_persona>/',
         GeneraCertificadoPdf.as_view(), name='descarga_certificado'),
    path('certificado-correo/<int:id_capacitacion>/participante/<int:id_persona>/', EnvioCertificadoCorreo.as_view(),
         name='envio_cert_correo'),
    path('certificado-multiple-correo/<int:id_capacitacion>', EnvioCertificadoMultiCorreo.as_view(),
         name='envio_cert_multi_correo'),
    path('eliminar/<str:pk>', EliminarCapacitacionView.as_view(), name='eliminar-capacitacion'),
    path('envia-para-revision/<str:pk>', EnviaParaRevisionView.as_view(), name='envia_para_revision'),
    path('crear-acta-asistencia/<int:id>/', ActaAsistenciaCreateView.as_view(),
         name='crear_acta_asistencia'),
    path('ver-acta-asistencia/<int:id>/', VerActaAsistenciaView.as_view(), name='ver_acta_asistencia'),
    path('bandeja-validacion', BandejaValidacionView.as_view(), name='bandeja_validacion'),
    
#     path('listar-capacitacion-validar', ListaCapacitacionValidarView.as_view(), name='listar_capacitacion_validar'),
    path('listar-capacitacion-validar/<str:inicio>/<str:fin>/<str:estado>', ListaCapacitacionValidarView.as_view(), name='listar_capacitacion_validar'),

    path('eliminar-acta/<str:pk>', EliminarActaView.as_view(), name='eliminar-acta'),
    path('observar-capacitacion/', ObservaCapacitacionView.as_view(), name='observar_capacitacion'),
    path('revisar-capacitacion/', RevisarCapacitacionView.as_view(), name='revisar_capacitacion'),
    path('bandeja-asignar-firmante/<int:id>/', BandejaAsignarFirmanteView.as_view(), name='bandeja_asignar_firmante'),
    path('asignar-firmante', AsignarFirmanteView.as_view(), name='asignar_firmante'),
    path('eliminar-responsable-firmante/<str:pk>/', EliminarResponsableFirmanteView.as_view(),
         name='eliminar_responsable_firma'),
    path('listar-firmante-ambito', ListaFirmanteAmbitoView.as_view(), name='firmante_ambito'),
    path('generar-certificados/<str:id>/', GenerarMultipleCertificadosPdfView.as_view(), name='generar_certificados'),
    path('ver-acta-asistencia-modal/<int:id>/<str:capacitacion_id>/', VerActaAsistenciaModalView.as_view(),
         name='ver_acta_asistencia_modal'),
    path('certificado-descarga-pdf-por-mod/<int:id_capacitacion>/modulo/<int:id_modulo>/participante/<int:id_persona>/',
         GeneraCertificadoPdfPorModulo.as_view(), name='descarga_certificado_por_modulo'),
    path('certificado-correo-por-mod/<int:id_capacitacion>/modulo/<int:id_modulo>/participante/<int:id_persona>/',
         EnvioCertificadoPorModuloCorreo.as_view(), name='envio_cert_por_mod_correo'),
    path('generar-certificados-por-mod/<str:id>/modulo/<str:id_modulo>',
         GenerarMultipleCertificadosPorModPdfView.as_view(), name='generar_certificados_por_mod'),
    path('certificado-multiple-correo-mod/<int:id_capacitacion>/<int:id_modulo>', EnvioCertificadoMultiCorreoMod.as_view(),
         name='envio_cert_multi_correo_mod'),
]
