package com.nun.team.base.response;


public class BaseResponse<T> {
    /**
     * 调用成功与否
     */
    private boolean success = true;
    /**
     * 失败code
     */
    private int code = 0;
    /**
     * 异常信息
     */
    private String msg = "success";
    /**
     * 数据
     */
    private T data;

    /**
     * 失败构造函数
     *
     * @param success
     * @param code
     * @param msg
     */
    public BaseResponse(boolean success, int code, String msg) {
        this.success = success;
        this.code = code;
        this.msg = msg;
    }

    /**
     * 失败构造函数带数据
     *
     * @param success
     * @param code
     * @param errMsg
     */
    public BaseResponse(boolean success, int code, String msg, T data) {
        this.success = success;
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    /**
     * 成功构造函数
     *
     * @param data
     */
    public BaseResponse(T data) {
        this.data = data;
    }

    /**
     * 成功
     *
     * @return
     */
    public static BaseResponse returnSuccess() {
        return new BaseResponse();
    }

    /**
     * 成功
     *
     * @param t
     * @return
     */
    public static BaseResponse returnSuccess(Object t) {
        return new BaseResponse(t);
    }

    /**
     * 失败
     *
     * @param code
     * @param errMsg
     * @return
     */
    public static BaseResponse returnFail(int code, String msg) {
        return new BaseResponse(false, code, msg);
    }


    public BaseResponse(){
        code = 0;
        this.msg = "success";
    }

    public T getData() {
        return data;
    }

    public BaseResponse setData(T data) {
        code = 0;
        this.msg = "success";
        this.data = data;
        return this;
    }

    @Override
    public String toString() {
        return "BaseResponse{" +
                "success=" + success +
                ", code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
