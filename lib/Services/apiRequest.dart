import 'package:edana/Api/api.dart';
import 'package:edana/Api/api_response.dart';
import 'package:edana/Api/app_exceptions.dart';
import 'package:edana/Model/tenantinfo_model.dart';
import 'package:edana/provider/tenantinfo_provider.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

class TenantInfoService{
  Future<ApiResponse<TenantInfoModel>?> fetchTenantInfo(BuildContext context)async{
    try{
      var respose = await Api.postRequestData('/graphql', '''{"query":"{\\r\\n  tenantInfo {\\r\\n    logoFileId\\r\\n    appLoginBgImgId\\r\\n    tenantId\\r\\n    isAdminTenant\\r\\n    loginPageMessage\\r\\n    siteName\\r\\n    __typename\\r\\n  }\\r\\n}\\r\\n","variables":{}}''', context);
    TenantInfoModel responseModel= TenantInfoModel.fromJson(respose);
    Provider.of<TenantInfoProvider>( context,listen: false).tenantInfoResponse=responseModel;
    print(responseModel);
    return ApiResponse.completed(responseModel);
    }on BadRequestException{
      return ApiResponse.error('Bad Request Exception');
      
    }on UnauthorisedException{
      return ApiResponse.error('The User is Unauthorized');
    }on RequestNotFoundException{
      return ApiResponse.error('Request Not Found Exception');
    }on UnautorizationException{
      return ApiResponse.error('The User is Unauthorized');
    }on InternalServerException{
      ApiResponse.error('Internal server error');
    }on ServerNotFoundException{
      ApiResponse.error('server not Available');
    }on FetchDataException{
      ApiResponse.error('An error occured while fetching the data');
    }catch (e){
      return ApiResponse.error(e.toString());
    }
    

  }
}