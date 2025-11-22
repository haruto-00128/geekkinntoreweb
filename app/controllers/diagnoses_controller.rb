class DiagnosesController < ApplicationController
  before_action :authenticate_user!

  # 診断だけ（保存しない）
  def create
    time = params[:diagnosis][:time]
    load = params[:diagnosis][:load]
    part = params[:diagnosis][:part]

    @results = WorkoutDiagnosisService.judge(time, load, part)

    render :result
  end

  # 保存専用
  def save
    selected = params[:selected_results] # ← チェックしたものだけ入る（配列）

    if selected.blank?
      redirect_to new_diagnosis_path, alert: "保存する種目を選択してください。"
      return
    end

    current_user.diagnoses.create(
      result: selected   # ← 配列をそのまま保存
    )

    redirect_to user_path(current_user), notice: "選択した結果を保存しました！"
  end
  def show
    @diagnosis = Diagnosis.find(params[:id])
  end
end