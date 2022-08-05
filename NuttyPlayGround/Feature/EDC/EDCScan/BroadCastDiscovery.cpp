//
// Created by nant on 8/20/21.
//
#include <string>
#include <memory>
#include <thread>
#include <chrono>
#include <random>
#include "UDPBroadcast.h"
#include "BroadCastDiscovery.h"
#include <cstdio>

#ifdef ANDROID_JNI
#include <jni.h>
#endif
namespace {
std::unique_ptr<UDPBroadcast> broadcaster_ = nullptr;
std::string broadcast_data_;

}

extern "C"
#ifdef ANDROID_JNI
JNIEXPORT void JNICALL
Java_com_edc_kbtg_nativebroadcast_EDCBroadcaster_StartEDCProcess(
                                                                 JNIEnv* env,
                                                                 jobject  jthis,
                                                                 jstring jtid,
                                                                 jstring jmid) {
#else
    void StartEDCProcess(const char * c_tid,const char* c_mid) {
#endif
#ifdef ANDROID_JNI
        const char* c_tid =env->GetStringUTFChars(jtid,0);
        const char* c_mid = env->GetStringUTFChars(jmid,0);;
#endif
        
        broadcast_data_ =std::string("DiscoveryResponse:")+
        std::string(c_tid)+
        std::string (":")+
        std::string(c_mid);
        if(broadcaster_ == nullptr)
            broadcaster_ = std::make_unique<UDPBroadcast>();
        
        const auto& EDCCallback = [&](const std::string& data)->void {
            if(data.find("DiscoveryHello") != std::string::npos){
                std::mt19937 random_generator( std::random_device{} ());
                std::uniform_int_distribution<> dist(200, 2000);
                
                std::this_thread::sleep_for(std::chrono::milliseconds(dist(random_generator)));
                
                broadcaster_->BroadcastUdp(broadcast_data_,6000);
            }
        };
        broadcaster_->StartListening(EDCCallback,6000);
        
#ifdef ANDROID_JNI
        //stupid
        env->ReleaseStringUTFChars(jtid,c_tid);
        env->ReleaseStringUTFChars(jmid,c_mid);
#endif
    }
    
    //TBC
    void POSProcessCallbackAndroid(){
        
    }
    
    void StartPOSProcessCCallBack(FoundDeviceCallback callback){
        if(broadcaster_ == nullptr)
            broadcaster_ = std::make_unique<UDPBroadcast>();
        const auto& POSCallback = [=](const std::string& data)->void {
            if(data.find("DiscoveryResponse") != std::string::npos){
                callback(data.c_str());
            }
        };
        broadcaster_->StartListening(POSCallback,6000);
        broadcaster_->BroadcastUdp("DiscoveryHello",6000);
        
    }
    
    void ReSendDiscoveryMessage(){
        if(broadcaster_ != nullptr){
            broadcaster_->BroadcastUdp("DiscoveryHello",6000);
        }
    }
    
    
    extern "C"
#ifdef ANDROID_JNI
    JNIEXPORT void JNICALL
    Java_com_edc_kbtg_nativebroadcast_EDCBroadcaster_StopProcess(JNIEnv* env,
                                                                 jobject /* this */) {
#else
        void StopProcess(){
#endif
            if (broadcaster_!= nullptr){
                broadcaster_.reset();
            }
        }
