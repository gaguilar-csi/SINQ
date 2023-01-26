CREATE OR REPLACE PACKAGE smpks_mantenimientos IS

  -- Author  : gaguilar@csi
  -- Created : 18/1/2023 10:36:27
  -- Purpose : Procedimientos y funciones de mantenimiento de esquema de seguridad de SINQ (SM)
  
  -- Código información de proceso exitoso
  cnCodigoSQLExitoso NUMBER(1)     := 0;
  -- Mensaje de información de proceso exitoso  
  cvProcesoExitoso   VARCHAR2(150) := 'Proceso aplicado correctamente'; 


  -- Función que encripta y retorna contraseña utilizando algoritmo MD5
  -- %param pvContrasena:  Contraseña sin encriptar 
  -- %return:              Valor encriptado, en caso vacío retorna NULL
  FUNCTION f_obtiene_contrasena_md5(pvContrasena IN VARCHAR2) RETURN VARCHAR2;
  
  -- Procedimiento que inserta un registro de usuario
  -- %param pId_usuario:       Id Usuario
  -- %param pId_cliente:       Id Cliente
  -- %param pNombre:           Nombre Usuario
  -- %param pContrasena:       Contraseña usuario
  -- %param pEmail:            Correo electrónico usuario
  -- %param pEstado:           Estado del usuario en el sistema  
  --  
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida  
  PROCEDURE p_usuarios_add(pId_usuario  IN  smtm_usuarios.id_usuario%TYPE,
                           pId_cliente  IN  smtm_usuarios.id_cliente%TYPE,
                           pNombre      IN  smtm_usuarios.nombre%TYPE,
                           pvContrasena IN  VARCHAR2,
                           pEmail       IN  smtm_usuarios.email%TYPE,
                           pEstado      IN  smtm_usuarios.estado%TYPE,
                           --
                           pvUsuarioReg IN  smtm_usuarios.usuario_adicion%TYPE,
                           pnSqlCode    OUT NUMBER,
                           pvSqlMsg     OUT VARCHAR2);
                           
  -- Procedimiento que consulta y extrae los usuarios
  -- %param pId_usuario:       Id Usuario
  --  
  -- %param curResultados      Cursor con datos del proceso
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida
  PROCEDURE p_usuarios_get(pId_usuario   IN  smtm_usuarios.id_usuario%TYPE,
                           --
                           curResultados OUT SYS_REFCURSOR,
                           pnSqlCode     OUT NUMBER,
                           pvSqlMsg      OUT VARCHAR2);

  -- Procedimiento de login que valida el acceso al sistema
  -- %param pId_usuario:       Id Usuario
  -- %param pContrasena:       Contraseña usuario
  --  
  -- %param curResultados      Cursor con datos del proceso  
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida
  PROCEDURE p_usuarios_get_login(pId_usuario IN smtm_usuarios.id_usuario%TYPE,
                                 --
                                 curResultados OUT SYS_REFCURSOR,
                                 pnSqlCode     OUT NUMBER,
                                 pvSqlMsg      OUT VARCHAR2);                             
                             
  -- Procedimiento que actualiza un registro de usuario
  -- %param pId_usuario:       Id Usuario
  -- %param pId_cliente:       Id Cliente
  -- %param pNombre:           Nombre Usuario
  -- %param pEmail:            Correo electrónico usuario
  -- %param pEstado:           Estado del usuario en el sistema  
  --  
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida               
  PROCEDURE p_usuarios_upd(pId_usuario  IN  smtm_usuarios.id_usuario%TYPE,
                           pId_cliente  IN  smtm_usuarios.id_cliente%TYPE,
                           pNombre      IN  smtm_usuarios.nombre%TYPE,
                           pEmail       IN  smtm_usuarios.email%TYPE,
                           pEstado      IN  smtm_usuarios.estado%TYPE,
                           --
                           pvUsuarioReg IN  smtm_usuarios.usuario_adicion%TYPE,
                           pnSqlCode    OUT NUMBER,
                           pvSqlMsg     OUT VARCHAR2);

  -- Procedimiento que elimina un registro de usuario
  -- %param pId_usuario:       Id Usuario
  --  
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida 
  PROCEDURE p_usuarios_del(pId_usuario IN  smtm_usuarios.id_usuario%TYPE,
                           --
                           pnSqlCode   OUT NUMBER,
                           pvSqlMsg    OUT VARCHAR2);                          
                           
  -- Procedimiento que inserta un registro de usuario
  -- %param pId_rol:           Id Rol
  -- %param pDescripcion:      Descripción del rol
  --  
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida                            
  PROCEDURE p_roles_add(pId_rol      IN  smtm_roles.id_rol%TYPE,
                        pDescripcion IN  smtm_roles.descripcion%TYPE,
                        --
                        pvUsuarioReg IN  smtm_roles.usuario_adicion%TYPE,
                        pnSqlCode    OUT NUMBER,
                        pvSqlMsg     OUT VARCHAR2);  
                        
  -- Procedimiento que consulta y extrae los roles
  -- %param pId_rol:           Id del Rol
  --  
  -- %param curResultados      Cursor con datos del proceso
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida
  PROCEDURE p_roles_get(pId_rol       IN  smtm_roles.id_rol%TYPE,
                        --
                        curResultados OUT SYS_REFCURSOR,
                        pnSqlCode     OUT NUMBER,
                        pvSqlMsg      OUT VARCHAR2);        
                        
  -- Procedimiento que actualiza un registro de rol
  -- %param pId_rol:           Id Rol
  -- %param pDescripcion:      Descripción del rol 
  --  
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida               
  PROCEDURE p_roles_upd(pId_rol      IN  smtm_roles.id_rol%TYPE,
                        pDescripcion IN  smtm_roles.descripcion%TYPE,
                        --
                        pvUsuarioReg IN  smtm_roles.usuario_adicion%TYPE,
                        pnSqlCode    OUT NUMBER,
                        pvSqlMsg     OUT VARCHAR2);       
                        
  -- Procedimiento que elimina un registro de rol
  -- %param pId_rol:           Id Rol
  -- 
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida 
  PROCEDURE p_roles_del(pId_rol     IN  smtm_roles.id_rol%TYPE,
                        --
                        pnSqlCode   OUT NUMBER,
                        pvSqlMsg    OUT VARCHAR2);   
                        
  -- Procedimiento que inserta un registro de menú
  -- %param pId_menu:          Id del menú
  -- %param pDescripcion:      Descripción del menú
  -- %param pTítulo:           Título del menú
  -- %param pId_Menu_Padre:    Id del menú padre 
  -- %param pPosición:         Posición del menú  
  -- 
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida                            
  PROCEDURE p_menus_add(pId_menu       IN  smtm_menus.id_menu%TYPE,
                        pDescripcion   IN  smtm_menus.descripcion%TYPE,
                        pTitulo        IN  smtm_menus.titulo%TYPE,
                        pId_menu_padre IN  smtm_menus.id_menu_padre%TYPE,
                        pPosicion      IN  smtm_menus.posicion%TYPE,
                        --
                        pvUsuarioReg   IN  smtm_menus.usuario_adicion%TYPE,
                        pnSqlCode      OUT NUMBER,
                        pvSqlMsg       OUT VARCHAR2);   
                        
  -- Procedimiento que consulta y extrae los menús
  -- %param pId_menu:          Id del menú
  -- 
  -- %param curResultados      Cursor con datos del proceso
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida
  PROCEDURE p_menus_get(pId_menu       IN  smtm_menus.id_menu%TYPE,
                        --
                        curResultados  OUT SYS_REFCURSOR,
                        pnSqlCode      OUT NUMBER,
                        pvSqlMsg       OUT VARCHAR2); 
                        
  -- Procedimiento que actualiza un registro de menú
  -- %param pId_menu:          Id del menú
  -- %param pDescripcion:      Descripción del menú
  -- %param pTítulo:           Título del menú
  -- %param pId_Menu_Padre:    Id del menú padre 
  -- %param pPosición:         Posición del menú  
  -- 
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida               
  PROCEDURE p_menus_upd(pId_menu       IN  smtm_menus.id_menu%TYPE,
                        pDescripcion   IN  smtm_menus.descripcion%TYPE,
                        pTitulo        IN  smtm_menus.titulo%TYPE,
                        pId_menu_padre IN  smtm_menus.id_menu_padre%TYPE,
                        pPosicion      IN  smtm_menus.posicion%TYPE,
                        --
                        pvUsuarioReg   IN  smtm_roles.usuario_adicion%TYPE,
                        pnSqlCode      OUT NUMBER,
                        pvSqlMsg       OUT VARCHAR2);       
                        
  -- Procedimiento que elimina un registro de rol
  -- %param pId_menu:          Id del menú
  -- 
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida 
  PROCEDURE p_menus_del(pId_menu    IN  smtm_menus.id_menu%TYPE,
                        --
                        pnSqlCode   OUT NUMBER,
                        pvSqlMsg    OUT VARCHAR2);   
                        
  -- Procedimiento que inserta un registro de pantalla
  -- %param pId_pantalla:      Id de la pantalla
  -- %param pDescripcion:      Descripción de la pantalla
  -- %param pTítulo:           Título de la pantalla
  -- %param pId_menu:          Id del menú asociado 
  -- %param pTipo:             Tipo de pantalla (M/P/C/R)  
  -- %param pPosición:         Posición de la pantalla en el menú  
  -- 
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida                            
  PROCEDURE p_pantallas_add(pId_pantalla   IN  smtm_pantallas.id_pantalla%TYPE,
                            pDescripcion   IN  smtm_pantallas.descripcion%TYPE,
                            pTitulo        IN  smtm_pantallas.titulo%TYPE,
                            pId_menu       IN  smtm_pantallas.id_menu%TYPE,
                            pTipo          IN  smtm_pantallas.tipo%TYPE,
                            pPosicion      IN  smtm_pantallas.posicion%TYPE,
                            --
                            pvUsuarioReg   IN  smtm_pantallas.usuario_adicion%TYPE,
                            pnSqlCode      OUT NUMBER,
                            pvSqlMsg       OUT VARCHAR2);        
                            
  -- Procedimiento que consulta y extrae las pantallas
  -- %param pId_pantalla:      Id de la pantalla
  -- 
  -- %param curResultados      Cursor con datos del proceso
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida
  PROCEDURE p_pantallas_get(pId_pantalla   IN  smtm_pantallas.id_pantalla%TYPE,
                            --
                            curResultados  OUT SYS_REFCURSOR,
                            pnSqlCode      OUT NUMBER,
                            pvSqlMsg       OUT VARCHAR2);    
                            
  -- Procedimiento que actualiza un registro de pantalla
  -- %param pId_pantalla:      Id de la pantalla
  -- %param pDescripcion:      Descripción de la pantalla
  -- %param pTítulo:           Título de la pantalla
  -- %param pId_menu:          Id del menú asociado 
  -- %param pTipo:             Tipo de pantalla (M/P/C/R)  
  -- %param pPosición:         Posición de la pantalla en el menú  
  -- 
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida               
  PROCEDURE p_pantallas_upd(pId_pantalla   IN  smtm_pantallas.id_pantalla%TYPE,
                            pDescripcion   IN  smtm_pantallas.descripcion%TYPE,
                            pTitulo        IN  smtm_pantallas.titulo%TYPE,
                            pId_menu       IN  smtm_pantallas.id_menu%TYPE,
                            pTipo          IN  smtm_pantallas.tipo%TYPE,
                            pPosicion      IN  smtm_pantallas.posicion%TYPE,
                            --
                            pvUsuarioReg   IN  smtm_roles.usuario_adicion%TYPE,
                            pnSqlCode      OUT NUMBER,
                            pvSqlMsg       OUT VARCHAR2);        
                            
  -- Procedimiento que elimina un registro de rol
  -- %param pId_pantalla:      Id de la pantalla
  -- 
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida 
  PROCEDURE p_pantallas_del(pId_pantalla   IN  smtm_pantallas.id_pantalla%TYPE,
                            --
                            pnSqlCode      OUT NUMBER,
                            pvSqlMsg       OUT VARCHAR2);          
                            
                            
  -- Procedimiento que inserta un registro de relación usuario y rol
  -- %param pId_usuario:       Id Usuario  
  -- %param pId_rol:           Id Rol
  -- 
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida                            
  PROCEDURE p_usuarios_roles_add(pId_usuario  IN  smtm_usuarios_roles.id_usuario%TYPE,
                                 pId_rol      IN  smtm_usuarios_roles.id_rol%TYPE,
                                 --
                                 pvUsuarioReg IN  smtm_usuarios_roles.usuario_adicion%TYPE,
                                 pnSqlCode    OUT NUMBER,
                                 pvSqlMsg     OUT VARCHAR2);       
                                 
  -- Procedimiento que consulta y extrae las relaciones usuario y rol
  -- %param pId_usuario:       Id Usuario  
  -- %param pId_rol:           Id Rol
  -- 
  -- %param curResultados      Cursor con datos del proceso
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida
  PROCEDURE p_usuarios_roles_get(pId_usuario   IN  smtm_usuarios_roles.id_usuario%TYPE,
                                 pId_rol       IN  smtm_usuarios_roles.id_rol%TYPE,
                                 --
                                 curResultados OUT SYS_REFCURSOR,
                                 pnSqlCode     OUT NUMBER,
                                 pvSqlMsg      OUT VARCHAR2); 
                                 
  -- Procedimiento que elimina un registro de relación usuario y rol
  -- %param pId_usuario:       Id Usuario  
  -- %param pId_rol:           Id Rol
  -- 
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida 
  PROCEDURE p_usuarios_roles_del(pId_usuario  IN  smtm_usuarios_roles.id_usuario%TYPE,
                                 pId_rol      IN  smtm_usuarios_roles.id_rol%TYPE,
                                 --
                                 pnSqlCode    OUT NUMBER,
                                 pvSqlMsg     OUT VARCHAR2); 
                                 
  -- Procedimiento que inserta un registro de relación rol, pantalla y permisos 
  -- %param pId_rol:           Id Rol
  -- %param pId_pantalla:      Id de la pantalla  
  -- %param pInsertar:         Permite insertar (S/N)
  -- %param pActualizar:       Permite actualizar (S/N) 
  -- %param pEliminar:         Permite eliminar (S/N)
  -- %param pProcesar:         Permite procesar (S/N) 
  -- %param pGenerar:          Permite generar (S/N)     
  --  
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida                            
  PROCEDURE p_roles_pantallas_permisos_add(pId_rol      IN  smtm_roles_pantallas_permisos.id_rol%TYPE,
                                           pId_pantalla IN  smtm_roles_pantallas_permisos.id_pantalla%TYPE,                
                                           pInsertar    IN  smtm_roles_pantallas_permisos.insertar%TYPE,
                                           pActualizar  IN  smtm_roles_pantallas_permisos.actualizar%TYPE,
                                           pEliminar    IN  smtm_roles_pantallas_permisos.eliminar%TYPE,
                                           pProcesar    IN  smtm_roles_pantallas_permisos.procesar%TYPE,
                                           pGenerar     IN  smtm_roles_pantallas_permisos.generar%TYPE,
                                           --
                                           pvUsuarioReg IN  smtm_usuarios_roles.usuario_adicion%TYPE,
                                           pnSqlCode    OUT NUMBER,
                                           pvSqlMsg     OUT VARCHAR2);      
                                           
  -- Procedimiento que consulta y extrae las relaciones rol, pantalla y permisos
  -- %param pId_usuario:       Id Usuario  
  -- %param pId_rol:           Id Rol
  --  
  -- %param curResultados      Cursor con datos del proceso
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida
  PROCEDURE p_roles_pantallas_permisos_get(pId_rol      IN  smtm_roles_pantallas_permisos.id_rol%TYPE,
                                           pId_pantalla IN  smtm_roles_pantallas_permisos.id_pantalla%TYPE,
                                           --
                                           curResultados OUT SYS_REFCURSOR,
                                           pnSqlCode     OUT NUMBER,
                                           pvSqlMsg      OUT VARCHAR2); 
                                           
  -- Procedimiento que actualiza un registro de relación rol, pantalla y permisos
  -- %param pId_rol:           Id Rol
  -- %param pId_pantalla:      Id de la pantalla  
  -- %param pInsertar:         Permite insertar (S/N)
  -- %param pActualizar:       Permite actualizar (S/N) 
  -- %param pEliminar:         Permite eliminar (S/N)
  -- %param pProcesar:         Permite procesar (S/N) 
  -- %param pGenerar:          Permite generar (S/N)  
  --  
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida               
  PROCEDURE p_roles_pantallas_permisos_upd(pId_rol      IN  smtm_roles_pantallas_permisos.id_rol%TYPE,
                                           pId_pantalla IN  smtm_roles_pantallas_permisos.id_pantalla%TYPE,                
                                           pInsertar    IN  smtm_roles_pantallas_permisos.insertar%TYPE,
                                           pActualizar  IN  smtm_roles_pantallas_permisos.actualizar%TYPE,
                                           pEliminar    IN  smtm_roles_pantallas_permisos.eliminar%TYPE,
                                           pProcesar    IN  smtm_roles_pantallas_permisos.procesar%TYPE,
                                           pGenerar     IN  smtm_roles_pantallas_permisos.generar%TYPE,
                                           --
                                           pvUsuarioReg   IN  smtm_roles.usuario_adicion%TYPE,
                                           pnSqlCode      OUT NUMBER,
                                           pvSqlMsg       OUT VARCHAR2);  
                                           
  -- Procedimiento que elimina un registro de relación rol, pantalla y permisos
  -- %param pId_usuario:       Id Usuario  
  -- %param pId_rol:           Id Rol
  --  
  -- %param pvUsuarioReg:      Usuario que registra
  -- %param pnSqlCode:         Código SQL de salida
  -- %param pnSqlMsg           Mensaje de salida 
  PROCEDURE p_roles_pantallas_permisos_del(pId_rol      IN  smtm_roles_pantallas_permisos.id_rol%TYPE,
                                           pId_pantalla IN  smtm_roles_pantallas_permisos.id_pantalla%TYPE,
                                           --
                                           pnSqlCode    OUT NUMBER,
                                           pvSqlMsg     OUT VARCHAR2);                                                                                                                                                        

END smpks_mantenimientos;
/
CREATE OR REPLACE PACKAGE BODY smpks_mantenimientos IS

  --
  FUNCTION f_obtiene_contrasena_md5(pvContrasena IN VARCHAR2) RETURN VARCHAR2 IS
    vnContrasenaEncr VARCHAR2(32);
  BEGIN
    
    IF pvContrasena IS NOT NULL THEN
      vnContrasenaEncr := utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5(input_string => pvContrasena));
    END IF;

    RETURN vnContrasenaEncr;
  
  END f_obtiene_contrasena_md5;
  
  -------------------------------------------------------------------------------------------------------------
  
  --
  PROCEDURE p_usuarios_add(pId_usuario  IN  smtm_usuarios.id_usuario%TYPE,
                           pId_cliente  IN  smtm_usuarios.id_cliente%TYPE,
                           pNombre      IN  smtm_usuarios.nombre%TYPE,
                           pvContrasena IN  VARCHAR2,
                           pEmail       IN  smtm_usuarios.email%TYPE,
                           pEstado      IN  smtm_usuarios.estado%TYPE,
                           --
                           pvUsuarioReg IN  smtm_usuarios.usuario_adicion%TYPE,
                           pnSqlCode    OUT NUMBER,
                           pvSqlMsg     OUT VARCHAR2)
  
  IS
    vvBanderaProc VARCHAR2(200);
    vrClaveEncr   smtm_usuarios.contrasena%TYPE;
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    vvBanderaProc := 'Encripta la clave de usuario';
    vrClaveEncr   := f_obtiene_contrasena_md5(pvContrasena);
  
    vvBanderaProc := 'Inserta registro';
    INSERT INTO smtm_usuarios
      (id_usuario,
       id_cliente,
       nombre,
       contrasena,
       email,
       estado,
       fecha_adicion,
       usuario_adicion)
    VALUES
      (pId_usuario,
       pId_cliente,
       pNombre,
       vrClaveEncr,
       pEmail,
       pEstado,
       pvUsuarioReg,
       SYSDATE);
  
    COMMIT;
  
  EXCEPTION
    WHEN dup_val_on_index THEN 
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Usuarios ADD: Código de usuario ya registrado';      
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Usuarios ADD: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_usuarios_add;

  --
  PROCEDURE p_usuarios_get(pId_usuario   IN  smtm_usuarios.id_usuario%TYPE,
                           --
                           curResultados OUT SYS_REFCURSOR,
                           pnSqlCode     OUT NUMBER,
                           pvSqlMsg      OUT VARCHAR2)
  
  IS
    vvBanderaProc VARCHAR2(200);
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    vvBanderaProc := 'Obtiene registros';
    OPEN curResultados FOR
      SELECT a.id_usuario,
             a.id_cliente,
             a.nombre,
             a.email,
             a.estado,
             a.ultimo_acceso,
             a.fecha_adicion,
             a.usuario_adicion,
             a.fecha_modificacion,
             a.usuario_modificacion
        FROM smtm_usuarios a
       WHERE a.id_usuario = NVL(pId_usuario, a.id_usuario);
  
  EXCEPTION
    WHEN OTHERS THEN
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Usuarios GET: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_usuarios_get;

  --
  PROCEDURE p_usuarios_get_login(pId_usuario IN smtm_usuarios.id_usuario%TYPE,
                                 --
                                 curResultados OUT SYS_REFCURSOR,
                                 pnSqlCode     OUT NUMBER,
                                 pvSqlMsg      OUT VARCHAR2)
  
  IS
    vvBanderaProc VARCHAR2(200);
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    OPEN curResultados FOR
      SELECT a.id_usuario, 
             a.contrasena, 
             a.nombre
        FROM smtm_usuarios a
       WHERE a.id_usuario = pId_usuario;
 
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Usuarios LogIn: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_usuarios_get_login;  

  --
 PROCEDURE p_usuarios_upd(pId_usuario  IN  smtm_usuarios.id_usuario%TYPE,
                           pId_cliente  IN  smtm_usuarios.id_cliente%TYPE,
                           pNombre      IN  smtm_usuarios.nombre%TYPE,
                           pEmail       IN  smtm_usuarios.email%TYPE,
                           pEstado      IN  smtm_usuarios.estado%TYPE,
                           --
                           pvUsuarioReg IN  smtm_usuarios.usuario_adicion%TYPE,
                           pnSqlCode    OUT NUMBER,
                           pvSqlMsg     OUT VARCHAR2)
  
  IS
    vvBanderaProc      VARCHAR2(200);
    vnExiste           NUMBER(1);
    --
    veConstrLlavePrim  EXCEPTION; -- Code -1
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    
    vvBanderaProc := 'Verifica que exista el usuario';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_usuarios a
     WHERE a.id_usuario = pId_usuario;
    
    IF vnExiste = 0 THEN
      RAISE veConstrLlavePrim;
    END IF; 

    vvBanderaProc := 'Actualiza registro';
    UPDATE smtm_usuarios
       SET id_cliente           = pId_cliente,
           nombre               = pNombre,
           email                = pEmail,
           estado               = pEstado,
           fecha_modificacion   = SYSDATE,
           usuario_modificacion = pvUsuarioReg
     WHERE id_usuario = pId_usuario;
  
    COMMIT;
  
  EXCEPTION
    WHEN veConstrLlavePrim THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Usuarios UPD: : No existe el usuario';    
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Usuarios UPD: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_usuarios_upd;

  --
  PROCEDURE p_usuarios_del(pId_usuario IN  smtm_usuarios.id_usuario%TYPE,
                           --
                           pnSqlCode   OUT NUMBER,
                           pvSqlMsg    OUT VARCHAR2)
  
  IS
    vvBanderaProc      VARCHAR2(200);
    vnExiste           NUMBER(1);
    --
    veConstrLlavePrim  EXCEPTION; -- Code -1    
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    
    vvBanderaProc := 'Verifica que exista el usuario';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_usuarios a
     WHERE a.id_usuario = pId_usuario;
    
    IF vnExiste = 0 THEN
      RAISE veConstrLlavePrim;
    END IF; 
    
    vvBanderaProc := 'Elimina registro';
    DELETE smtm_usuarios WHERE id_usuario = pId_usuario;
  
    COMMIT;
  
  EXCEPTION
    WHEN veConstrLlavePrim THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Usuarios DEL: : No existe el usuario';    
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Usuarios DEL: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_usuarios_del;    
  
  --
  PROCEDURE p_roles_add(pId_rol      IN  smtm_roles.id_rol%TYPE,
                        pDescripcion IN  smtm_roles.descripcion%TYPE,
                        --
                        pvUsuarioReg IN  smtm_roles.usuario_adicion%TYPE,
                        pnSqlCode    OUT NUMBER,
                        pvSqlMsg     OUT VARCHAR2)
  IS
    vvBanderaProc VARCHAR2(200);
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    vvBanderaProc := 'Inserta registro';
    INSERT INTO smtm_roles
      (id_rol, 
       descripcion, 
       fecha_adicion, 
       usuario_adicion)
    VALUES
      (pId_rol,
       pDescripcion,
       SYSDATE,
       pvUsuarioReg);
  
    COMMIT;
  
  EXCEPTION
    WHEN dup_val_on_index THEN 
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Roles ADD: Código de rol ya registrado';      
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Roles ADD: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_roles_add;  
  
  --
  PROCEDURE p_roles_get(pId_rol       IN  smtm_roles.id_rol%TYPE,
                        --
                        curResultados OUT SYS_REFCURSOR,
                        pnSqlCode     OUT NUMBER,
                        pvSqlMsg      OUT VARCHAR2)
  
  IS
    vvBanderaProc VARCHAR2(200);
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    vvBanderaProc := 'Obtiene registros';
    OPEN curResultados FOR
      SELECT a.id_rol,
             a.descripcion,
             a.fecha_adicion,
             a.usuario_adicion,
             a.fecha_modificacion,
             a.usuario_modificacion
        FROM smtm_roles a
       WHERE a.id_rol = NVL(pId_rol, a.id_rol);
  
  EXCEPTION
    WHEN OTHERS THEN
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Roles GET: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_roles_get;  
  
  --
  PROCEDURE p_roles_upd(pId_rol      IN  smtm_roles.id_rol%TYPE,
                        pDescripcion IN  smtm_roles.descripcion%TYPE,
                        --
                        pvUsuarioReg IN  smtm_roles.usuario_adicion%TYPE,
                        pnSqlCode    OUT NUMBER,
                        pvSqlMsg     OUT VARCHAR2)
  
  IS
    vvBanderaProc      VARCHAR2(200);
    vnExiste           NUMBER(1);
    --
    veConstrLlavePrim  EXCEPTION; -- Code -1
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    
    vvBanderaProc := 'Verifica que exista el rol';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_roles a
     WHERE a.id_rol = pId_rol;
    
    IF vnExiste = 0 THEN
      RAISE veConstrLlavePrim;
    END IF;
    
    vvBanderaProc := 'Actualiza registro';
    UPDATE smtm_roles
       SET descripcion          = pDescripcion,
           fecha_modificacion   = SYSDATE,
           usuario_modificacion = pvUsuarioReg
     WHERE id_rol = pId_rol;
  
    COMMIT;
  
  EXCEPTION
    WHEN veConstrLlavePrim THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Roles UPD: : No existe el rol';    
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Roles UPD: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_roles_upd;  
  
  --
  PROCEDURE p_roles_del(pId_rol     IN  smtm_roles.id_rol%TYPE,
                        --
                        pnSqlCode   OUT NUMBER,
                        pvSqlMsg    OUT VARCHAR2)
  
  IS
    vvBanderaProc      VARCHAR2(200);
    vnExiste           NUMBER(1);
    --
    veConstrLlavePrim  EXCEPTION; -- Code -1
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    
    vvBanderaProc := 'Verifica que exista el rol';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_roles a
     WHERE a.id_rol = pId_rol;
    
    IF vnExiste = 0 THEN
      RAISE veConstrLlavePrim;
    END IF;
    
    vvBanderaProc := 'Elimina registro';
    DELETE smtm_roles WHERE id_rol = pId_rol;
  
    COMMIT;
  
  EXCEPTION
    WHEN veConstrLlavePrim THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Roles DEL: : No existe el rol';    
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Roles DEL: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_roles_del;  
  
  --
  PROCEDURE p_menus_add(pId_menu       IN  smtm_menus.id_menu%TYPE,
                        pDescripcion   IN  smtm_menus.descripcion%TYPE,
                        pTitulo        IN  smtm_menus.titulo%TYPE,
                        pId_menu_padre IN  smtm_menus.id_menu_padre%TYPE,
                        pPosicion      IN  smtm_menus.posicion%TYPE,
                        --
                        pvUsuarioReg   IN  smtm_menus.usuario_adicion%TYPE,
                        pnSqlCode      OUT NUMBER,
                        pvSqlMsg       OUT VARCHAR2)
  IS
    vvBanderaProc VARCHAR2(200);
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    vvBanderaProc := 'Inserta registro';
    INSERT INTO smtm_menus
    (id_menu, 
     descripcion, 
     titulo, 
     id_menu_padre, 
     posicion, 
     fecha_adicion, 
     usuario_adicion)
    VALUES
    (pId_menu,      
     pDescripcion,  
     pTitulo,       
     pId_Menu_Padre,
     pPosicion,     
     SYSDATE,
     pvUsuarioReg);
  
    COMMIT;
  
  EXCEPTION
    WHEN dup_val_on_index THEN 
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Menús ADD: Código de menú ya registrado';    
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Menús ADD: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_menus_add;  
  
  --
  PROCEDURE p_menus_get(pId_menu       IN  smtm_menus.id_menu%TYPE,
                        --
                        curResultados  OUT SYS_REFCURSOR,
                        pnSqlCode      OUT NUMBER,
                        pvSqlMsg       OUT VARCHAR2)
  
  IS
    vvBanderaProc VARCHAR2(200);
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    vvBanderaProc := 'Obtiene registros';
    OPEN curResultados FOR
      SELECT a.id_menu,
             a.descripcion,
             a.titulo,
             a.id_menu_padre,
             a.liclass,
             a.aclass,
             a.iclass,
             a.posicion,
             a.fecha_adicion,
             a.usuario_adicion,
             a.fecha_modificacion,
             a.usuario_modificacion
        FROM smtm_menus a
       WHERE a.id_menu = NVL(pId_menu, a.id_menu);
  
  EXCEPTION
    WHEN OTHERS THEN
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Menús GET: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_menus_get;  
  
  --
  PROCEDURE p_menus_upd(pId_menu       IN  smtm_menus.id_menu%TYPE,
                        pDescripcion   IN  smtm_menus.descripcion%TYPE,
                        pTitulo        IN  smtm_menus.titulo%TYPE,
                        pId_menu_padre IN  smtm_menus.id_menu_padre%TYPE,
                        pPosicion      IN  smtm_menus.posicion%TYPE,
                        --
                        pvUsuarioReg   IN  smtm_roles.usuario_adicion%TYPE,
                        pnSqlCode      OUT NUMBER,
                        pvSqlMsg       OUT VARCHAR2)
  
  IS
    vvBanderaProc      VARCHAR2(200);
    vnExiste           NUMBER(1);
    --
    veConstrLlavePrim  EXCEPTION; -- Code -1
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    
    vvBanderaProc := 'Verifica que exista el menú';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_menus a
     WHERE a.id_menu = pId_menu;
    
    IF vnExiste = 0 THEN
      RAISE veConstrLlavePrim;
    END IF;
    
    vvBanderaProc := 'Actualiza registro';
    UPDATE smtm_menus
       SET descripcion          = pDescripcion,
           titulo               = pTitulo,
           id_menu_padre        = pId_menu_padre,
           posicion             = pPosicion,
           fecha_modificacion   = SYSDATE,
           usuario_modificacion = pvUsuarioReg
     WHERE id_menu = pId_menu;
  
    COMMIT;
  
  EXCEPTION
    WHEN veConstrLlavePrim THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Menús UPD: : No existe el menú';    
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Menús UPD: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_menus_upd;  
  
  --
  PROCEDURE p_menus_del(pId_menu    IN  smtm_menus.id_menu%TYPE,
                        --
                        pnSqlCode   OUT NUMBER,
                        pvSqlMsg    OUT VARCHAR2)
  
  IS
    vvBanderaProc      VARCHAR2(200);
    vnExiste           NUMBER(1);
    --
    veConstrLlavePrim  EXCEPTION; -- Code -1
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    
    vvBanderaProc := 'Verifica que exista el menú';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_menus a
     WHERE a.id_menu = pId_menu;
    
    IF vnExiste = 0 THEN
      RAISE veConstrLlavePrim;
    END IF;
    
    vvBanderaProc := 'Elimina registro';
    DELETE smtm_menus WHERE id_menu = pId_menu;
  
    COMMIT;
  
  EXCEPTION
    WHEN veConstrLlavePrim THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Menús DEL: : No existe el menú';     
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Menús DEL: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_menus_del;   
  
  --
  PROCEDURE p_pantallas_add(pId_pantalla   IN  smtm_pantallas.id_pantalla%TYPE,
                            pDescripcion   IN  smtm_pantallas.descripcion%TYPE,
                            pTitulo        IN  smtm_pantallas.titulo%TYPE,
                            pId_menu       IN  smtm_pantallas.id_menu%TYPE,
                            pTipo          IN  smtm_pantallas.tipo%TYPE,
                            pPosicion      IN  smtm_pantallas.posicion%TYPE,
                            --
                            pvUsuarioReg   IN  smtm_pantallas.usuario_adicion%TYPE,
                            pnSqlCode      OUT NUMBER,
                            pvSqlMsg       OUT VARCHAR2)
  IS
    vvBanderaProc VARCHAR2(200);
    vnExiste      NUMBER(1);
    --
    veConstrMenu  EXCEPTION; -- Code -1     
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    vvBanderaProc := 'Verifica que exista el menú';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_menus a
     WHERE a.id_menu = pId_menu;
    
    IF vnExiste = 0 THEN
      RAISE veConstrMenu;
    END IF;     
    
    vvBanderaProc := 'Inserta registro';
    INSERT INTO smtm_pantallas
    (id_pantalla, 
     descripcion, 
     titulo, 
     id_menu, 
     tipo,  
     posicion, 
     fecha_adicion, 
     usuario_adicion)
    VALUES
    (pId_pantalla,
     pDescripcion,
     pTitulo,   
     pId_menu,    
     pTipo,       
     pPosicion,   
     SYSDATE,
     pvUsuarioReg);
  
    COMMIT;
  
  EXCEPTION
    WHEN dup_val_on_index THEN 
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Pantallas ADD: Código de pantalla ya registrado';     
    WHEN veConstrMenu THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Pantallas ADD: Menú relacionado inexistente';    
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Pantallas ADD: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_pantallas_add;  
  
  --
  PROCEDURE p_pantallas_get(pId_pantalla   IN  smtm_pantallas.id_pantalla%TYPE,
                            --
                            curResultados  OUT SYS_REFCURSOR,
                            pnSqlCode      OUT NUMBER,
                            pvSqlMsg       OUT VARCHAR2)
  
  IS
    vvBanderaProc VARCHAR2(200);
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    vvBanderaProc := 'Obtiene registros';
    OPEN curResultados FOR
      SELECT a.id_pantalla,
             a.descripcion,
             a.titulo,
             a.id_menu,
             a.tipo,
             a.accion,
             a.controlador,
             a.liclass,
             a.aclass,
             a.iclass,
             a.posicion,
             a.fecha_adicion,
             a.usuario_adicion,
             a.fecha_modificacion,
             a.usuario_modificacion
        FROM smtm_pantallas a
       WHERE a.id_pantalla = NVL(pId_pantalla, a.id_pantalla);
  
  EXCEPTION
    WHEN OTHERS THEN
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Pantallas GET: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_pantallas_get;  
  
  --
  PROCEDURE p_pantallas_upd(pId_pantalla   IN  smtm_pantallas.id_pantalla%TYPE,
                            pDescripcion   IN  smtm_pantallas.descripcion%TYPE,
                            pTitulo        IN  smtm_pantallas.titulo%TYPE,
                            pId_menu       IN  smtm_pantallas.id_menu%TYPE,
                            pTipo          IN  smtm_pantallas.tipo%TYPE,
                            pPosicion      IN  smtm_pantallas.posicion%TYPE,
                            --
                            pvUsuarioReg   IN  smtm_roles.usuario_adicion%TYPE,
                            pnSqlCode      OUT NUMBER,
                            pvSqlMsg       OUT VARCHAR2)
  
  IS
    vvBanderaProc      VARCHAR2(200);
    vnExiste           NUMBER(1);
    --
    veConstrLlavePrim  EXCEPTION; -- Code -1
    veConstrMenu       EXCEPTION; -- Code -2     
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    
    vvBanderaProc := 'Verifica que exista la pantalla';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_pantallas a
     WHERE a.id_pantalla = pId_pantalla;
    
    IF vnExiste = 0 THEN
      RAISE veConstrLlavePrim;
    END IF;
    
    vvBanderaProc := 'Verifica que exista el menú';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_menus a
     WHERE a.id_menu = pId_menu;
    
    IF vnExiste = 0 THEN
      RAISE veConstrMenu;
    END IF;     
    
    vvBanderaProc := 'Actualiza registro';
    UPDATE smtm_pantallas
       SET descripcion          = pDescripcion,
           titulo               = pTitulo,
           id_menu              = pId_menu,
           tipo                 = pTipo,
           posicion             = pPosicion,
           fecha_modificacion   = SYSDATE,
           usuario_modificacion = pvUsuarioReg
     WHERE id_pantalla = pId_pantalla;
  
    COMMIT;
  
  EXCEPTION
    WHEN veConstrLlavePrim THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Pantallas UPD: : No existe la pantalla';    
    WHEN veConstrMenu THEN
      pnSqlCode := -2;
      pvSqlMsg  := 'SM - Pantallas UPD: Menú relacionado inexistente';     
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Pantallas UPD: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_pantallas_upd;  
  
  --
  PROCEDURE p_pantallas_del(pId_pantalla   IN  smtm_pantallas.id_pantalla%TYPE,
                            --
                            pnSqlCode      OUT NUMBER,
                            pvSqlMsg       OUT VARCHAR2)
  
  IS
    vvBanderaProc      VARCHAR2(200);
    vnExiste           NUMBER(1);
    --
    veConstrLlavePrim  EXCEPTION; -- Code -1
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    
    vvBanderaProc := 'Verifica que exista la pantalla';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_pantallas a
     WHERE a.id_pantalla = pId_pantalla;
    
    IF vnExiste = 0 THEN
      RAISE veConstrLlavePrim;
    END IF;
    
    vvBanderaProc := 'Elimina registro';
    DELETE smtm_pantallas WHERE id_pantalla = pId_pantalla;
  
    COMMIT;
  
  EXCEPTION
    WHEN veConstrLlavePrim THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Pantallas DEL: : No existe la pantalla';    
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Pantallas DEL: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_pantallas_del;  

  --
  PROCEDURE p_usuarios_roles_add(pId_usuario  IN  smtm_usuarios_roles.id_usuario%TYPE,
                                 pId_rol      IN  smtm_usuarios_roles.id_rol%TYPE,
                                 --
                                 pvUsuarioReg IN  smtm_usuarios_roles.usuario_adicion%TYPE,
                                 pnSqlCode    OUT NUMBER,
                                 pvSqlMsg     OUT VARCHAR2)
  IS
    vvBanderaProc   VARCHAR2(200);
    vnExiste        NUMBER(1);
    --
    veConstrUsuario EXCEPTION; -- Code -1  
    veConstrRol     EXCEPTION; -- Code -2         
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    
    vvBanderaProc := 'Verifica que exista el usuario';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_usuarios a
     WHERE a.id_usuario = pId_usuario;
    
    IF vnExiste = 0 THEN
      RAISE veConstrUsuario;
    END IF; 
    
    vvBanderaProc := 'Verifica que exista el rol';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_roles a
     WHERE a.id_rol = pId_rol;
    
    IF vnExiste = 0 THEN
      RAISE veConstrRol;
    END IF;  
    
    vvBanderaProc := 'Inserta el registro';
    INSERT INTO smtm_usuarios_roles
      (id_usuario, 
       id_rol, 
       fecha_adicion, 
       usuario_adicion)
    VALUES
      (pId_usuario,
       pId_rol,
       SYSDATE,
       pvUsuarioReg);
  
    COMMIT;
  
  EXCEPTION
    WHEN dup_val_on_index THEN 
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Usuarios Roles ADD: Códigos usuario-rol ya registrados';    
    WHEN veConstrUsuario THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Usuarios Roles ADD: Usuario relacionado inexistente';
    WHEN veConstrRol THEN
      pnSqlCode := -2;
      pvSqlMsg  := 'SM - Usuarios Roles ADD: Rol relacionado inexistente';
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Usuarios Roles ADD: ' || vvBanderaProc || ' - ' ||  SQLERRM;
  END p_usuarios_roles_add;
  
  --
  PROCEDURE p_usuarios_roles_get(pId_usuario  IN  smtm_usuarios_roles.id_usuario%TYPE,
                                 pId_rol      IN  smtm_usuarios_roles.id_rol%TYPE,
                                 --
                                 curResultados OUT SYS_REFCURSOR,
                                 pnSqlCode     OUT NUMBER,
                                 pvSqlMsg      OUT VARCHAR2)
  
  IS
    vvBanderaProc VARCHAR2(200);
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    vvBanderaProc := 'Obtiene registros';
    OPEN curResultados FOR
      SELECT a.id_usuario,
             a.id_rol,
             a.fecha_adicion,
             a.usuario_adicion
        FROM smtm_usuarios_roles a
       WHERE a.id_usuario = NVL(pId_usuario, a.id_usuario)
         AND a.id_rol = NVL(pId_rol, a.id_rol);
  
  EXCEPTION
    WHEN OTHERS THEN
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Usuarios Roles GET: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_usuarios_roles_get; 
  
  --
  PROCEDURE p_usuarios_roles_del(pId_usuario  IN  smtm_usuarios_roles.id_usuario%TYPE,
                                 pId_rol      IN  smtm_usuarios_roles.id_rol%TYPE,
                                 --
                                 pnSqlCode    OUT NUMBER,
                                 pvSqlMsg     OUT VARCHAR2)
  
  IS
    vvBanderaProc      VARCHAR2(200);
    vnExiste           NUMBER(1);
    --
    veConstrLlavePrim  EXCEPTION; -- Code -1
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    
    vvBanderaProc := 'Verifica que exista el usuario-rol';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_usuarios_roles a
     WHERE a.id_usuario = pId_usuario 
       AND a.id_rol = pId_rol;
    
    IF vnExiste = 0 THEN
      RAISE veConstrLlavePrim;
    END IF;
    
    vvBanderaProc := 'Elimina registro';
    DELETE smtm_usuarios_roles 
     WHERE id_usuario = pId_usuario 
       AND id_rol = pId_rol;
  
    COMMIT;
  
  EXCEPTION
    WHEN veConstrLlavePrim THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Usuarios Roles DEL: : No existe el usuario-rol';     
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Usuarios Roles DEL: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_usuarios_roles_del;
  
  --
  PROCEDURE p_roles_pantallas_permisos_add(pId_rol      IN  smtm_roles_pantallas_permisos.id_rol%TYPE,
                                           pId_pantalla IN  smtm_roles_pantallas_permisos.id_pantalla%TYPE,                
                                           pInsertar    IN  smtm_roles_pantallas_permisos.insertar%TYPE,
                                           pActualizar  IN  smtm_roles_pantallas_permisos.actualizar%TYPE,
                                           pEliminar    IN  smtm_roles_pantallas_permisos.eliminar%TYPE,
                                           pProcesar    IN  smtm_roles_pantallas_permisos.procesar%TYPE,
                                           pGenerar     IN  smtm_roles_pantallas_permisos.generar%TYPE,
                                           --
                                           pvUsuarioReg IN  smtm_usuarios_roles.usuario_adicion%TYPE,
                                           pnSqlCode    OUT NUMBER,
                                           pvSqlMsg     OUT VARCHAR2)
  IS
    vvBanderaProc    VARCHAR2(200);
    vnExiste         NUMBER(1);
    --
    veConstrRol      EXCEPTION; -- Code -1      
    veConstrPantalla EXCEPTION; -- Code -2      
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    vvBanderaProc := 'Verifica que exista el rol';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_roles a
     WHERE a.id_rol = pId_rol;
    
    IF vnExiste = 0 THEN
      RAISE veConstrRol;
    END IF;  
    
    vvBanderaProc := 'Verifica que exista la pantalla';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_pantallas a
     WHERE a.id_pantalla = pId_pantalla;
    
    IF vnExiste = 0 THEN
      RAISE veConstrPantalla;
    END IF;     
    
    vvBanderaProc := 'Inserta registro';
    INSERT INTO smtm_roles_pantallas_permisos
     (id_rol, 
      id_pantalla, 
      insertar, 
      actualizar, 
      eliminar, 
      procesar, 
      generar, 
      fecha_adicion, 
      usuario_adicion)
    VALUES
      (pId_rol,    
       pId_pantalla,
       pInsertar, 
       pActualizar,
       pEliminar,  
       pProcesar,  
       pGenerar,  
       SYSDATE,
       pvUsuarioReg);
  
    COMMIT;
  
  EXCEPTION
    WHEN dup_val_on_index THEN 
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Roles Pantallas Permisos ADD: Códigos rol-pantalla ya registrados';     
    WHEN veConstrRol THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Roles Pantallas Permisos ADD: Rol relacionado inexistente';
    WHEN veConstrPantalla THEN
      pnSqlCode := -2;
      pvSqlMsg  := 'SM - Roles Pantallas Permisos ADD: Pantalla relacionado inexistente';
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Roles Pantallas Permisos ADD: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_roles_pantallas_permisos_add; 
  
  --
  PROCEDURE p_roles_pantallas_permisos_get(pId_rol      IN  smtm_roles_pantallas_permisos.id_rol%TYPE,
                                           pId_pantalla IN  smtm_roles_pantallas_permisos.id_pantalla%TYPE,
                                           --
                                           curResultados OUT SYS_REFCURSOR,
                                           pnSqlCode     OUT NUMBER,
                                           pvSqlMsg      OUT VARCHAR2)
  
  IS
    vvBanderaProc VARCHAR2(200);
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    vvBanderaProc := 'Obtiene registros';
    OPEN curResultados FOR
      SELECT a.id_rol,
             a.id_pantalla,
             a.insertar,
             a.actualizar,
             a.eliminar,
             a.procesar,
             a.generar,
             a.fecha_adicion,
             a.usuario_adicion,
             a.fecha_modificacion,
             a.usuario_modificacion
        FROM smtm_roles_pantallas_permisos a
       WHERE a.id_rol = NVL(pId_rol, a.id_rol)
         AND a.id_pantalla = NVL(pId_pantalla, a.id_pantalla);
  
  EXCEPTION
    WHEN OTHERS THEN
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Roles Pantallas Permisos GET: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_roles_pantallas_permisos_get;    
  
  --
  PROCEDURE p_roles_pantallas_permisos_upd(pId_rol      IN  smtm_roles_pantallas_permisos.id_rol%TYPE,
                                           pId_pantalla IN  smtm_roles_pantallas_permisos.id_pantalla%TYPE,                
                                           pInsertar    IN  smtm_roles_pantallas_permisos.insertar%TYPE,
                                           pActualizar  IN  smtm_roles_pantallas_permisos.actualizar%TYPE,
                                           pEliminar    IN  smtm_roles_pantallas_permisos.eliminar%TYPE,
                                           pProcesar    IN  smtm_roles_pantallas_permisos.procesar%TYPE,
                                           pGenerar     IN  smtm_roles_pantallas_permisos.generar%TYPE,
                                           --
                                           pvUsuarioReg   IN  smtm_roles.usuario_adicion%TYPE,
                                           pnSqlCode      OUT NUMBER,
                                           pvSqlMsg       OUT VARCHAR2)
  
  IS
    vvBanderaProc      VARCHAR2(200);
    vnExiste           NUMBER(1);
    --
    veConstrLlavePrim  EXCEPTION; -- Code -1
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso
    
    vvBanderaProc := 'Verifica que exista el rol-pantalla';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_roles_pantallas_permisos a
     WHERE a.id_rol = pId_rol
       AND a.id_pantalla = pId_pantalla;
    
    IF vnExiste = 0 THEN
      RAISE veConstrLlavePrim;
    END IF;
    
    vvBanderaProc := 'Actualiza registro';
    UPDATE smtm_roles_pantallas_permisos
       SET insertar             = pInsertar,
           actualizar           = pActualizar, 
           eliminar             = pEliminar,
           procesar             = pProcesar,
           generar              = pGenerar,
           fecha_modificacion   = SYSDATE,
           usuario_modificacion = pvUsuarioReg
     WHERE id_rol = pId_rol
       AND id_pantalla = pId_pantalla;
  
    COMMIT;
  
  EXCEPTION
    WHEN veConstrLlavePrim THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Roles Pantallas Permisos UPD: : No existe el rol-pantalla';    
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Roles Pantallas Permisos UPD: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_roles_pantallas_permisos_upd;   
  
  --
  PROCEDURE p_roles_pantallas_permisos_del(pId_rol      IN  smtm_roles_pantallas_permisos.id_rol%TYPE,
                                           pId_pantalla IN  smtm_roles_pantallas_permisos.id_pantalla%TYPE,
                                           --
                                           pnSqlCode    OUT NUMBER,
                                           pvSqlMsg     OUT VARCHAR2)
  
  IS
    vvBanderaProc      VARCHAR2(200);
    vnExiste           NUMBER(1);
    --
    veConstrLlavePrim  EXCEPTION; -- Code -1
  BEGIN
    -- Se inicializa como exitoso
    pnSqlCode := cnCodigoSQLExitoso;
    pvSqlMsg  := cvProcesoExitoso;
  
    -- Inicio de proceso 
    vvBanderaProc := 'Verifica que exista el rol-pantalla';
    SELECT COUNT(0)
      INTO vnExiste
      FROM smtm_roles_pantallas_permisos a
     WHERE a.id_rol = pId_rol
       AND a.id_pantalla = pId_pantalla;
    
    IF vnExiste = 0 THEN
      RAISE veConstrLlavePrim;
    END IF;
    
    vvBanderaProc := 'Elimina registro';
    DELETE smtm_roles_pantallas_permisos 
     WHERE id_rol = pId_rol
       AND id_pantalla = pId_pantalla;
  
    COMMIT;
  
  EXCEPTION
    WHEN veConstrLlavePrim THEN
      pnSqlCode := -1;
      pvSqlMsg  := 'SM - Roles Pantallas Permisos DEL: : No existe el rol-pantalla';    
    WHEN OTHERS THEN
      ROLLBACK;
      pnSqlCode := SQLCODE;
      pvSqlMsg  := 'SM - Roles Pantallas Permisos DEL: ' || vvBanderaProc || ' - ' || SQLERRM;
  END p_roles_pantallas_permisos_del;     

END smpks_mantenimientos;
/
